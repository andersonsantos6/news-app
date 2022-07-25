import 'package:flutter/material.dart';
import 'package:interior_baiano/src/components/circle_widgets.dart';
import 'package:interior_baiano/src/components/custom_card.dart';
import 'package:interior_baiano/src/model/news_list.dart';
import 'package:interior_baiano/src/controller/web_radio_controller.dart';
import 'package:provider/provider.dart';

import '../components/appBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsList>(context, listen: false).loadNews();
  }

  @override
  Widget build(BuildContext context) {
    var webRadioController = Provider.of<WebRadio>(context, listen: false);
    var newsList = Provider.of<NewsList>(context).newsList;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(webRadioController: webRadioController)),
        drawer: const Drawer(),
        backgroundColor: Colors.white,
        body: newsList.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(
                      color: Colors.red,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Carregando Notícias...',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    )
                  ],
                ),
              )
            : Column(
                children: [
                  const Story(),
                  const Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: newsList.length,
                      itemBuilder: (context, index) {
                        return CustomCard(index: index, newsList: newsList);
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
