import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:coinginner_flutter/models/news.dart';
import 'package:dio/dio.dart';
import '../services/http_news_service.dart';
import 'package:coinginner_flutter/screens/news_screen.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Top News'),
        ),
        body: FutureBuilder(
          future: NewsService.getTrendingNews(),
          builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var allNews = snapshot.data;
                  if (allNews is List<News>) {
                    return ListView.builder(
                        itemCount: allNews.length,
                        itemBuilder: (BuildContext itemContext, int index) {
                          News news = allNews[index];
                          var desc = news.description.substring(
                              0,
                              news.description.length < 255
                                  ? news.description.length
                                  : 255);

                          return Card(
                              child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(children: [
                              Expanded(
                                child: Image.network(news.imgURL),
                              ),
                              Expanded(
                                  child: ListTile(
                                title: Text(news.title),
                                subtitle: Text(
                                  desc,
                                  maxLines: 3,
                                ),
                              )),
                            ]),
                          ));
                        });
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
        ));
  }
}
