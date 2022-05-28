import 'package:flutter/material.dart';
import 'package:interior_baiano/src/model/news_list.dart';
import 'package:interior_baiano/src/controller/web_radio_controller.dart';
import 'package:interior_baiano/src/page/home_page.dart';
import 'package:interior_baiano/src/page/news_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => NewsList(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => WebRadio(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomePage(),
          '/newsPage': (context) => const NewsPage()
        },
      ),
    );
  }
}
