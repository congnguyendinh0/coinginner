import 'package:coinginner_flutter/controllers/dropdown_controller.dart';
import 'package:coinginner_flutter/screens/cryptocurrency_detail_screen.dart_screen.dart';
import 'package:flutter/material.dart';

import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:get/get.dart';

import '../services/http_coin_service.dart';

class CoinScreen extends StatelessWidget {
  CoinScreen({Key? key}) : super(key: key);
  final dropdownController = Get.put(DropdownController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Text("COINGINNER"),
          actions: [
            DropdownButton<String>(
              dropdownColor: Color(0xff340b93),
              icon: const Icon(Icons.arrow_drop_down),
              value: dropdownController.orderDropdownValue.value,
              // differenct currencies
              items: <String>[
                'market_cap_asc',
                'market_cap_desc',
                'volume_asc',
                'volume_desc'
              ].map<DropdownMenuItem<String>>((String order) {
                return DropdownMenuItem(
                  value: order,
                  child: Text(
                    // replace all _ with spaces
                    order.replaceAll(RegExp('[/_/]'), ' ').toUpperCase(),
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
                    currency.toUpperCase(),
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
          future: CoinService().getCryptocurrencyList(
              order: dropdownController.orderDropdownValue.value,
              currency: dropdownController.currencyDropdownValue.value),
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
                                      backgroundColor: Color(0xffF72585),
                                    ),
                                    title: Center(
                                      child: Text(cryptocurrency.name,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    onTap: () {
                                      Get.to(() => CoinDetailScreen(
                                          cryptocurrency:
                                              cryptoCurrencyList[index]));
                                    },
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: ListTile(
                                      title:
                                          Text(cryptocurrency.currentPrice.toStringAsFixed(2),
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                      subtitle: cryptocurrency.priceChangePercentage24h > 0
                                          ? Text('\u{25B2}' + cryptocurrency.priceChangePercentage24h.toStringAsFixed(2) + " %",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold))
                                          : Text(
                                              '\u{25BC}' +
                                                  cryptocurrency
                                                      .priceChangePercentage24h
                                                      .toStringAsFixed(2) +
                                                  " %",
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
