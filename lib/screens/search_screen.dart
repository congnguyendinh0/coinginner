import 'package:coinginner_flutter/controllers/searchUrl_controller.dart';
import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:coinginner_flutter/models/trending/trending.dart';
import 'package:coinginner_flutter/screens/cryptocurrency_detail_screen.dart_screen.dart';
import 'package:coinginner_flutter/services/http_trending.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  // final searchUrlController = SearchUrlController.to;
  final searchUrlController = Get.put(SearchUrlController());
  Future<Trending> getTrending() async {
    var response =
        await Dio().get("https://api.coingecko.com/api/v3/search/trending");
    if (response.statusCode == 200) {
      Trending trending = Trending.fromJson(response.data);
      return trending;
    } else {
      throw Exception("Error");
    }
  }

  Future<List<Cryptocurrency>> getCryptocurrencyList(
      {String id = "bitcoin"}) async {
    var response = await Dio().get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=${id}&order=market_cap_desc&per_page=1&page=1&sparkline=true&price_change_percentage=7d%2C30d%2C1y');

    if (response.statusCode == 200) {
      List<dynamic> responseList = response.data;
      List<Cryptocurrency> cryptoCurrencyList = [];
      for (var i = 0; i < responseList.length; i++) {
        cryptoCurrencyList.add(Cryptocurrency.fromJSON(responseList[i]));
      }
      return cryptoCurrencyList;
      // return cryptocurrencyList.map((e) => Cryptocurrency.fromJSON(e)).toList();
    } else {
      throw Exception("Error");
    }
  }

  Future<List<Cryptocurrency>> getTrendingList({String ids = "url"}) async {
    var response = await Dio().get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=${ids}&order=market_cap_desc&per_page=1&page=1&sparkline=true&price_change_percentage=7d%2C30d%2C1y');

    if (response.statusCode == 200) {
      List<dynamic> responseList = response.data;
      List<Cryptocurrency> cryptoCurrencyList = [];
      for (var i = 0; i < responseList.length; i++) {
        cryptoCurrencyList.add(Cryptocurrency.fromJSON(responseList[i]));
      }
      return cryptoCurrencyList;
      // return cryptocurrencyList.map((e) => Cryptocurrency.fromJSON(e)).toList();
    } else {
      throw Exception("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "SEARCH",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Obx(() => Text(searchUrlController.url.value)),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText:
                          'Search for cryptocurrency (e.g bitcoin) with coingecko id'),
                  onSubmitted: (id) => searchUrlController.setUrl(id),
                ),
              ),
              Obx(() => FutureBuilder(
                    future: getCryptocurrencyList(
                        id: searchUrlController.url.value
                            .replaceAll(RegExp('\\s+'), '')
                            .toLowerCase()),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Cryptocurrency>> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.done:
                          if (snapshot.hasData) {
                            var cryptoCurrencyList = snapshot.data;
                            if (cryptoCurrencyList is List<Cryptocurrency>) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: cryptoCurrencyList.length,
                                  itemBuilder:
                                      (BuildContext itemContext, int index) {
                                    Cryptocurrency cryptocurrency =
                                        cryptoCurrencyList[index];

                                    return Card(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 5, 20, 5),
                                      child: Row(children: [
                                        Expanded(
                                            flex: 2,
                                            child: ListTile(
                                              leading: CircleAvatar(
                                                foregroundImage: NetworkImage(
                                                    cryptocurrency.image),
                                                backgroundColor:
                                                    Color(0xffF72585),
                                              ),
                                              title: Center(
                                                child: Text(cryptocurrency.name,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                              ),
                                              onTap: () {
                                                //without getx
                                                //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoinDetailScreen(cryptocurrency: cryptoCurrencyList[index],)));
                                                Get.to(() => CoinDetailScreen(
                                                    cryptocurrency:
                                                        cryptoCurrencyList[
                                                            index]));
                                              },
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: ListTile(
                                                title: Text(
                                                    cryptocurrency.currentPrice
                                                        .toStringAsFixed(2),
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                subtitle: cryptocurrency.priceChangePercentage24h > 0
                                                    ? Text('\u{25B2}' + cryptocurrency.priceChangePercentage24h.toStringAsFixed(2) + " %",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight
                                                                .bold))
                                                    : Text('\u{25BC}' + cryptocurrency.priceChangePercentage24h.toStringAsFixed(2) + " %",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight: FontWeight.bold))))
                                      ]),
                                    ));
                                  });
                            }
                          }
                          break;
                        case ConnectionState.waiting:
                          return Center(child: Text(''));
                        case ConnectionState.none:
                          return Text("Error");
                        default:
                          return Text("Error");
                      }

                      return Text("");
                    },
                  )),
              Divider(),
              Container(
                  margin: EdgeInsets.fromLTRB(5, 10, 5, 20),
                  child: Text(
                    'EXPLORE TRENDING COINS',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  )),
              FutureBuilder<Trending>(
                future: getTrending(),
                builder:
                    (BuildContext context, AsyncSnapshot<Trending> snapshot) {
                  if (snapshot.hasData) {
                    var trending = snapshot.data;

                    if (trending != null) {
                      var trending1 = trending.coins![0].item!.id!;
                      var trending2 = trending.coins![1].item!.id!;
                      var trending3 = trending.coins![2].item!.id!;
                      var trending4 = trending.coins![3].item!.id!;
                      var trending5 = trending.coins![4].item!.id!;
                      var trending6 = trending.coins![5].item!.id!;
                      var trending7 = trending.coins![5].item!.id!;
                      var url =
                          "$trending1%2C$trending2%2C$trending3%2C$trending4%2C$trending5%2C$trending6%2C$trending7";
                      return Column(
                        children: [
                          FutureBuilder(
                            future: getTrendingList(ids: url),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Cryptocurrency>> snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.done:
                                  if (snapshot.hasData) {
                                    var cryptoCurrencyList = snapshot.data;
                                    if (cryptoCurrencyList
                                        is List<Cryptocurrency>) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: cryptoCurrencyList.length,
                                          itemBuilder:
                                              (BuildContext itemContext,
                                                  int index) {
                                            Cryptocurrency cryptocurrency =
                                                cryptoCurrencyList[index];

                                            return Card(
                                                child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 5, 20, 5),
                                              child: Row(children: [
                                                Expanded(
                                                    flex: 2,
                                                    child: ListTile(
                                                      leading: CircleAvatar(
                                                        foregroundImage:
                                                            NetworkImage(
                                                                cryptocurrency
                                                                    .image),
                                                        backgroundColor:
                                                            Colors.pink,
                                                      ),
                                                      title: Center(
                                                        child: Text(
                                                            cryptocurrency.name,
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )),
                                                      ),
                                                      onTap: () {
                                                        //without getx
                                                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoinDetailScreen(cryptocurrency: cryptoCurrencyList[index],)));
                                                        Get.to(() =>
                                                            CoinDetailScreen(
                                                                cryptocurrency:
                                                                    cryptoCurrencyList[
                                                                        index]));
                                                      },
                                                    )),
                                                Expanded(
                                                    flex: 1,
                                                    child: ListTile(
                                                        title: Text(cryptocurrency.currentPrice.toStringAsFixed(2),
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                        subtitle: cryptocurrency.priceChangePercentage24h > 0
                                                            ? Text('\u{25B2}' + cryptocurrency.priceChangePercentage24h.toStringAsFixed(2) + " %",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))
                                                            : Text(
                                                                '\u{25BC}' + cryptocurrency.priceChangePercentage24h.toStringAsFixed(2) + " %",
                                                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))
                                              ]),
                                            ));
                                          });
                                    }
                                  }
                                  break;
                                case ConnectionState.waiting:
                                  return Center(child: Text(''));
                                case ConnectionState.none:
                                  return Text("Error");
                                default:
                                  return Text("Error");
                              }

                              return Text("");
                            },
                          )
                        ],
                      );
                    }
                  }
                  return const Text("");
                },
              ),
            ]),
          )),
    );
  }
}
