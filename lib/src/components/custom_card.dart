import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:interior_baiano/src/model/news_model.dart';

class CustomCard extends StatefulWidget {
  late List<NewsModel> newsList;
  late int index;
  CustomCard({Key? key, required this.index, required this.newsList})
      : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/newsPage',
            arguments: NewsModel(
                videoLink: widget.newsList[widget.index].videoLink,
                image: widget.newsList[widget.index].image,
                key: widget.newsList[widget.index].key,
                title: widget.newsList[widget.index].title,
                body: widget.newsList[widget.index].body,
                subject: widget.newsList[widget.index].subject,
                dateTime: widget.newsList[widget.index].dateTime),
          );
        },
        child: Card(
          elevation: 6,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.22,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                Expanded(
                    flex: 2,
                    child: widget.newsList[widget.index].image == null
                        ? Center(
                            child: Icon(Icons.image_not_supported),
                          )
                        : Container(
                            child: Image.network(
                            widget.newsList[widget.index].image.toString(),
                            fit: BoxFit.cover,
                          ))),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.newsList[widget.index].subject == null
                              ? const Icon(Icons.error_outline)
                              : Text(
                                  widget.newsList[widget.index].subject
                                      .toUpperCase(),
                                  style: const TextStyle(
                                    fontFamily: 'Oswald-VariableFont_wght',
                                    fontSize: 12,
                                    color: Colors.black,
                                  )),
                          widget.newsList[widget.index].dateTime == null ||
                                  widget.newsList[widget.index].dateTime
                                          .length !=
                                      10
                              ? const Icon(Icons.error_outline)
                              : Text(
                                  DateTime.parse(
                                    widget.newsList[widget.index].dateTime,
                                  ).toString().substring(0, 10),
                                  style: const TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Container(
                            child: Expanded(
                              child: Text(
                                widget.newsList[widget.index].title.length > 50
                                    ? widget.newsList[widget.index].title
                                        .substring(0, 50)
                                    : widget.newsList[widget.index].title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 191, 6, 6),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                              widget.newsList[widget.index].body.substring(
                                  0,
                                  widget.newsList[widget.index].body.length > 80
                                      ? 80
                                      : widget
                                          .newsList[widget.index].body.length),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'Lato-Regular',
                              )),
                        ),
                      ),
                    ]),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
