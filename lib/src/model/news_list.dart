import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:interior_baiano/src/model/news_model.dart';

class NewsList with ChangeNotifier {
  List<NewsModel> _newsList = [];
  List<NewsModel> get newsList {
    return [..._newsList];
  }

  final _url = 'https://interior-baiano-default-rtdb.firebaseio.com/news';
  Future loadNews() async {
    var response = await http.get(Uri.parse('$_url.json'));
    if (response == 'null') return;

    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);
    data.forEach(
      (key, value) {
        _newsList.clear();
        Future.delayed(const Duration(seconds: 1), () {
          _newsList.add(
            NewsModel(
                key: key,
                videoLink: value['videoLink'],
                image: value['image'],
                title: value['title'],
                body: value['body'],
                subject: value['subject'],
                dateTime: value['dateTime']),
          );
          notifyListeners();
        });
      },
    );
    notifyListeners();
  }

  Future<void> addChannel(NewsModel newsModel) async {
    final response = await http.post(
      Uri.parse('$_url.json'),
      body: jsonEncode(
        {
          'videoLink': newsModel.videoLink,
          'title': newsModel.title,
          'body': newsModel.body,
          'subject': newsModel.subject,
          'dateTime': newsModel.dateTime
        },
      ),
    );
    notifyListeners();
  }

  searchLink(String videolink) {
    for (var i in newsList) {
      if (i.videoLink == videolink) {
        return i.videoLink;
      }
    }
    notifyListeners();
  }
}
