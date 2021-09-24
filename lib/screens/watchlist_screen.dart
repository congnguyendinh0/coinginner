import 'package:coinginner_flutter/controllers/dropdown_controller.dart';
import 'package:coinginner_flutter/screens/cryptocurrency_detail_screen.dart_screen.dart';
import 'package:coinginner_flutter/services/http_watchlist_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WatchListScreen extends StatelessWidget {
  WatchListScreen({Key? key}) : super(key: key);

  // control the drop down for order and currency
  final dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    /// access the coinbox
    var coinBox = Hive.box<String>('coinBox');
    //  for example (bitcoin, ethereum, dogecoin) - > bitcoin%2Cethereum%2c
    // 1. coinbox.tomap => get every document in the box  .values =>  get all values (ids) toString() make them to a string + replace all whitespaces and commas and add them together as the final ids string
    var coinBoxString = coinBox
        .toMap()
        .values
        .toString()
        .replaceAll(RegExp('\\s+'), '')
        .replaceAll(',', '%2C');
    //print(coinBoxString);

// Obx state manager, is like statefulwidget,listens for .obs changes from controller which was declared and initialized,rebuilds itself everytime changes
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Text("WATCHLIST"),
          actions: [
            DropdownButton<String>(
              dropdownColor: Color(0xff340b93),
              icon: const Icon(Icons.arrow_drop_down),
              // values from the dropdownController order .obs
              value: dropdownController.orderDropdownValue.value,
              items: <String>[
                'market_cap_asc',
                'market_cap_desc',
                'volume_asc',
                'volume_desc'
              ].map<DropdownMenuItem<String>>((String order) {
                // removing every _  from the text
                return DropdownMenuItem(
                  value: order,
                  child: Text(
                    //replaces all _ symbols
                    order.replaceAll(RegExp('[/_/g]'), ' ').toUpperCase(),
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),

              // onchange this function from our controller will be called and update the order
              onChanged: (order) => dropdownController.setOrder(order!),
            ),
            DropdownButton<String>(
              // same logic here
              dropdownColor: Color(0xff340b93),
              icon: const Icon(Icons.arrow_drop_down),
              value: dropdownController.currencyDropdownValue.value,
              items: <String>[
                'usd',
                'eur',
                'vnd',
                'aud',
                'gbp',
                'rub',
                'cad',
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
        // Futurebuilder  takes a future in js (promise) and builds itself based on its snapshot
        body: FutureBuilder(
          // future is in js promise // getting the list of  cryptos based on the paramieters  // coinboxstring is our id strng
          //fetches the watchlist -> based on the url created above coinboxstring
          future: WatchListService().getWatchList(
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
                                    onTap: () {},
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: ListTile(
                                    title: Text(
                                        cryptocurrency.currentPrice
                                            .toStringAsFixed(2),
                                        maxLines: 1,
                                        style: TextStyle(color: Colors.white)),
                                    subtitle: Text(
                                        cryptocurrency.priceChangePercentage24h
                                                .toStringAsFixed(2) +
                                            " %",
                                        style: TextStyle(color: Colors.white)),
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
