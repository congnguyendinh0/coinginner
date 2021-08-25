import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:coinginner_flutter/models/news.dart';
import 'package:dio/dio.dart';
import '../services/http_news_service.dart';
import 'package:coinginner_flutter/screens/news_screen.dart';

class NewsScreenUpdate extends StatelessWidget {
  const NewsScreenUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('EXPLORE'),
      ),
      body: FutureBuilder(
        future: NewsService.getTrendingNews(),
        builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                var allNews = snapshot.data;
                if (allNews is List<News>) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: allNews.length,
                          itemBuilder: (BuildContext itemContext, int index) {
                            News news = allNews[index];
                            var desc = news.description.substring(
                                0,
                                news.description.length < 255
                                    ? news.description.length
                                    : 255);

                            return SizedBox(
                              height: MediaQuery.of(context).size.height / 4,
                              width: MediaQuery.of(context).size.width,
                              child: Card(
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.network(news.imgURL),
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                }
              }
              break;
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.none:
              return Text("Error");
            default:
              return Text("Error");
          }

          return CircularProgressIndicator();
        },
      ),
    ));
  }
}
