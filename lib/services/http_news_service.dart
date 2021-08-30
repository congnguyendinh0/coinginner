import 'dart:convert';

import 'package:coinginner_flutter/models/news.dart';
import 'package:dio/dio.dart';

class NewsService {
  static String get TRENDING {
    return "https://api.coinstats.app/public/v1/news/trending?skip=0&limit=5";
  }

  static String get HANDPICKED {
    return "https://api.coinstats.app/public/v1/news/handpicked?skip=0&limit=5";
  }
  // First try
  //http package did not work due to null error,upgraded to dio
  // static Future<List<News>> getNews() async {
  //   var url = Uri.parse(NewsService.ENDPOINT);

  //   final response = await http.get(url); -> http package did not work due to null error
  //   if (response.statusCode == 200) {
  //     List<News> news = (json.decode(response.body) as List)
  //         .map((e) => News.fromJSON(e))
  //         .toList();

  //     return news;
  //   } else {
  //     throw Exception("Error");
  //   }
  // }

  static Future<List<News>> getTrendingNews() async {
    var response = await Dio().get(NewsService.TRENDING);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = response.data as Map<String, dynamic>;
      var jsonValue = body["news"];
      List<News> allNews = [];
      for (var i = 0; i < jsonValue.length; i++) {
        var element = News.fromJSON(jsonValue[i]);
        allNews.add(element);
      }
      return allNews;
    } else {
      throw Exception("Error");
    }
  }

  static Future<List<News>> getHandpickedNews() async {
    Response response = await Dio().get(NewsService.HANDPICKED);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = response.data as Map<String, dynamic>;
      var jsonValue = body["news"];
      List<News> allNews = [];
      for (var i = 0; i < jsonValue.length; i++) {
        var element = News.fromJSON(jsonValue[i]);
        allNews.add(element);
      }
      return allNews;
    } else {
      throw Exception("Error");
    }
  }
}
