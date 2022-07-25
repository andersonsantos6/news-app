import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:interior_baiano/src/components/appBar.dart';
import 'package:interior_baiano/src/model/news_model.dart';
import 'package:provider/provider.dart';

import '../components/video_player_widget.dart';
import '../controller/web_radio_controller.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late final newsArguments =
      ModalRoute.of(context)!.settings.arguments as NewsModel;

  @override
  Widget build(BuildContext context) {
    var webRadioController = Provider.of<WebRadio>(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(webRadioController: webRadioController)),
        body: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: Text(
                newsArguments.subject.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.red,
                    fontFamily: 'Oswald-VariableFont_wght'),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(newsArguments.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(newsArguments.dateTime,
                      style: const TextStyle(fontSize: 10))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child:
                  Center(child: Image.network(newsArguments.image.toString())),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  newsArguments.body,
                  style: TextStyle(
                    fontFamily: 'Lato-Regular',
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            newsArguments.videoLink == null
                ? Container()
                : VideoPlayerWidget(newsModel: newsArguments)
          ],
        ),
      ),
    );
  }
}
