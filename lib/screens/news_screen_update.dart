import 'package:coinginner_flutter/models/global/global.dart';
import 'package:coinginner_flutter/screens/search_screen.dart';

import 'package:coinginner_flutter/services/http_global_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coinginner_flutter/models/news.dart';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/http_news_service.dart';

class NewsScreenUpdate extends StatelessWidget {
  const NewsScreenUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Get.to(SearchScreen());
                    },
                    icon: const Icon(Icons.search))
              ],
              title: Text('EXPLORE'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: ListTile(
                        trailing: Icon(Icons.local_fire_department),
                        title: Text(
                          'TRENDING',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
                  ),
                  FutureBuilder(
                    future: NewsService.getTrendingNews(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<News>> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          if (snapshot.hasData) {
                            var allNews = snapshot.data;
                            if (allNews is List<News>) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  width: MediaQuery.of(context).size.width - 10,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: allNews.length,
                                      itemBuilder: (BuildContext itemContext,
                                          int index) {
                                        News news = allNews[index];
                                        return SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              10,
                                          child: Card(
                                              color: Colors.black,
                                              child: Stack(children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                              news.imgURL,
                                                            ),
                                                            fit: BoxFit.fill))),
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      8,
                                                  decoration: new BoxDecoration(
                                                      color: Colors.black),
                                                  child: ListTile(
                                                      leading: CircleAvatar(
                                                        foregroundImage:
                                                            NetworkImage(
                                                                news.icon),
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                      title: Text(
                                                        news.title,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      subtitle: Text(
                                                          news.description,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                ),

                                                // detects clicks on onTap and then launches the links
                                                GestureDetector(
                                                  onTap: () async {
                                                    await canLaunch(news.link)
                                                        ? await launch(
                                                            news.link,
                                                          )
                                                        : throw Exception(
                                                            "Error");
                                                  },
                                                ),
                                              ])),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: ListTile(
                        trailing: Icon(Icons.select_all),
                        title: Text(
                          'HANDPICKED',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )),
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
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4,
                                  width: MediaQuery.of(context).size.width - 10,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: allNews.length,
                                      itemBuilder: (BuildContext itemContext,
                                          int index) {
                                        News news = allNews[index];

                                        return SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              10,
                                          child: Card(
                                              color: Colors.black,
                                              child: Stack(children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                news.imgURL),
                                                            fit: BoxFit.fill))),
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      8,
                                                  decoration: new BoxDecoration(
                                                      color: Colors.black),
                                                  child: ListTile(
                                                      leading: CircleAvatar(
                                                        foregroundImage:
                                                            NetworkImage(
                                                                news.icon),
                                                        backgroundColor:
                                                            Colors.black,
                                                      ),
                                                      title: Text(
                                                        news.title,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      subtitle: Text(
                                                          news.description,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    await canLaunch(news.link)
                                                        ? await launch(
                                                            news.link,
                                                          )
                                                        : throw Exception(
                                                            "Error");
                                                  },
                                                ),
                                              ])),
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: ListTile(
                            trailing: Icon(Icons.local_movies),
                            title: Text(
                              'GLOBAL DATA',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            )),
                      ),

                      //
                      FutureBuilder<Global>(
                        future: GlobalService.getGlobal(),
                        builder: (BuildContext context,
                            AsyncSnapshot<Global> snapshot) {
                          if (snapshot.hasData) {
                            var global = snapshot.data;

                            if (global != null) {
                              if (global.data != null) {
                                var data = global.data;
                                var totalMarketCap = data?.totalMarketCap;
                                return Column(
                                  children: [
                                    ListTile(
                                        title: Text('',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        subtitle: Text(
                                            '''ACTIVE CRYPTOS: ${NumberFormat.compactCurrency(decimalDigits: 1, symbol: '').format(data?.activeCryptocurrencies)}\nONGOING ICOs: ${data?.ongoingIcos}\nUPCOMING ICOs: ${data?.upcomingIcos}\nMARKETS: ${data?.markets}\nMARKET CAP: ${NumberFormat.compactCurrency(decimalDigits: 3, symbol: 'USD').format(totalMarketCap?.usd)} ${NumberFormat.compactCurrency(decimalDigits: 3, symbol: 'EURO ').format(totalMarketCap?.eur)} ${NumberFormat.compactCurrency(decimalDigits: 3, symbol: 'VND ').format(totalMarketCap?.vnd)}\nBITCOIN DOMINANCE:${data!.marketCapPercentage!.btc!.roundToDouble()}%''',
                                            style: TextStyle(
                                                color: Colors.white))),
                                  ],
                                );
                              }
                            }
                          }
                          return const Text("");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
