import 'package:coinginner_flutter/controllers/dropdown_controller.dart';
import 'package:coinginner_flutter/screens/cryptocurrency_detail_screen.dart_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../services/http_coin_service.dart';

class WatchListScreen extends StatelessWidget {
  WatchListScreen({Key? key}) : super(key: key);

  Future<List<Cryptocurrency>> getCryptocurrencyList(
      {String order = 'market_cap_desc',
      String currency = 'usd',
      String ids = 'bitcoin'}) async {
    var response = await Dio().get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currency&ids=$ids&order=$order&per_page=250&page=1&sparkline=false&price_change_percentage=7d');

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

  final dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    var coinBox = Hive.box<String>('coinBox');
    var coinBoxString = coinBox
        .toMap()
        .values
        .toString()
        .replaceAll(RegExp('\\s+'), '')
        .replaceAll(',', '%2C');
    print(coinBoxString);
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Text("COIN LIST"),
          actions: [
            DropdownButton<String>(
              dropdownColor: Color(0xff340b93),
              icon: const Icon(Icons.arrow_drop_down),
              value: dropdownController.orderDropdownValue.value,
              items: <String>[
                'market_cap_asc',
                'market_cap_desc',
                'volume_asc',
                'volume_desc'
              ].map<DropdownMenuItem<String>>((String order) {
                return DropdownMenuItem(
                  value: order,
                  child: Text(
                    order.replaceAll(RegExp('[/_/g]'), ' ').toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (order) => dropdownController.setOrder(order!),
            ),
            DropdownButton<String>(
              dropdownColor: Color(0xff340b93),
              icon: const Icon(Icons.arrow_drop_down),
              value: dropdownController.currencyDropdownValue.value,
              items: <String>[
                'usd',
                'eur',
                'vnd',
                'btc',
                'eth',
                'bnb',
              ].map<DropdownMenuItem<String>>((String currency) {
                return DropdownMenuItem(
                  value: currency,
                  child: Text(
                    currency.replaceAll(RegExp('[/_/g]'), ' ').toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (currency) =>
                  dropdownController.setCurrency(currency!),
            )
          ],
        ),
        body: FutureBuilder(
          future: getCryptocurrencyList(
              order: dropdownController.orderDropdownValue.value,
              currency: dropdownController.currencyDropdownValue.value,
              ids: coinBoxString),
          builder: (BuildContext context,
              AsyncSnapshot<List<Cryptocurrency>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasData) {
                  var cryptoCurrencyList = snapshot.data;
                  if (cryptoCurrencyList is List<Cryptocurrency>) {
                    return ListView.builder(
                        itemCount: cryptoCurrencyList.length,
                        itemBuilder: (BuildContext itemContext, int index) {
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
                                      foregroundImage:
                                          NetworkImage(cryptocurrency.image),
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
                                      /*  Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CoinDetailScreen(
                                                    cryptocurrency:
                                                        cryptoCurrencyList[
                                                            index])),
                                      ); */

                                      Get.to(() => CoinDetailScreen(
                                          cryptocurrency:
                                              cryptoCurrencyList[index]));
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
                                      cryptocurrency.priceChangePercentage24h
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
        )));
  }
}
