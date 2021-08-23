import 'package:coinginner_flutter/screens/cryptocurrency_detail_screen.dart_screen.dart';
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
                                    title: Text(cryptocurrency.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        )),
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
        ));
  }
}
