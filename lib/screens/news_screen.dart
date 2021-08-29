import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:coinginner_flutter/models/news.dart';
import 'package:dio/dio.dart';
import '../services/http_news_service.dart';
import 'package:coinginner_flutter/screens/news_screen.dart';

// First version of newsscreen
class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
                title: Text('Top News'),
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.trending_up), text: "TRENDING"),
                    Tab(
                      icon: Icon(Icons.price_check_rounded),
                      text: "HANDPICKED",
                    ),
                  ],
                )),
            body: TabBarView(
              children: [
                FutureBuilder(
                  future: NewsService.getTrendingNews(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<News>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          var allNews = snapshot.data;
                          if (allNews is List<News>) {
                            return ListView.builder(
                                itemCount: allNews.length,
                                itemBuilder:
                                    (BuildContext itemContext, int index) {
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
                ),
                FutureBuilder(
                  future: NewsService.getHandpickedNews(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<News>> snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.done:
                        if (snapshot.hasData) {
                          var allNews = snapshot.data;
                          if (allNews is List<News>) {
                            return ListView.builder(
                                itemCount: allNews.length,
                                itemBuilder:
                                    (BuildContext itemContext, int index) {
                                  News news = allNews[index];
                                  var desc = news.description.substring(
                                      0,
                                      news.description.length < 255
                                          ? news.description.length
                                          : 255);

                                  return GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                        child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Row(children: [
                                        Expanded(
                                          child: Image.network(news.imgURL),
                                        ),
                                        Expanded(
                                            child: ListTile(
                                          title: Text(
                                            news.title,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          subtitle: Text(
                                            desc,
                                            maxLines: 3,
                                          ),
                                        )),
                                      ]),
                                    )),
                                  );
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
                )
              ],
            )));
  }
}
