import 'package:coinginner_flutter/controllers/searchUrl_controller.dart';
import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:coinginner_flutter/screens/cryptocurrency_detail_screen.dart_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  // final searchUrlController = SearchUrlController.to;
  final searchUrlController = Get.put(SearchUrlController());

  Future<List<Cryptocurrency>> getCryptocurrencyList(
      {String id = "bitcoin"}) async {
    var response = await Dio().get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=${id}&order=market_cap_desc&per_page=1&page=1&sparkline=true&price_change_percentage=7d');

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
          title: Text("Search"),
        ),
        body: Column(children: [
          // Obx(() => Text(searchUrlController.url.value)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'bitcoin'),
              onSubmitted: (id) => searchUrlController.setUrl(id),
            ),
          ),
          Obx(() => FutureBuilder(
                future:
                    getCryptocurrencyList(id: searchUrlController.url.value),
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
                                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: Row(children: [
                                    Expanded(
                                        flex: 2,
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            foregroundImage: NetworkImage(
                                                cryptocurrency.image),
                                            backgroundColor: Colors.pink,
                                          ),
                                          title: Center(
                                            child: Text(cryptocurrency.name,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ),
                                          onTap: () {
                                            //without getx
                                            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoinDetailScreen(cryptocurrency: cryptoCurrencyList[index],)));
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoinDetailScreen(
                                                          cryptocurrency:
                                                              cryptoCurrencyList[
                                                                  index])),
                                            );
                                          },
                                        )),
                                    Expanded(
                                        flex: 1,
                                        child: ListTile(
                                          title: Text(
                                            cryptocurrency.currentPrice
                                                .toStringAsFixed(2),
                                            maxLines: 1,
                                          ),
                                          subtitle: Text(
                                            cryptocurrency
                                                    .priceChangePercentage24h
                                                    .toStringAsFixed(2) +
                                                " %",
                                          ),
                                        ))
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
              ))
        ]),
      ),
    );
  }
}
