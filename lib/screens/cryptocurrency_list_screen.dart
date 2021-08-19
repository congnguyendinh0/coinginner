import 'package:flutter/material.dart';

import 'package:coinginner_flutter/models/cryptocurrency.dart';

import '../services/http_coin_service.dart';

class CoinScreen extends StatelessWidget {
  const CoinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Top Coins'),
        ),
        body: FutureBuilder(
          future: CoinService.getCryptocurrencyList(),
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
                            padding: EdgeInsets.all(10.0),
                            child: Row(children: [
                              Expanded(
                                child: Image.network(cryptocurrency.image),
                              ),
                              Expanded(
                                  child: ListTile(
                                title: Text(cryptocurrency.name),
                                subtitle: Text(
                                  cryptocurrency.currentPrice.toString(),
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
