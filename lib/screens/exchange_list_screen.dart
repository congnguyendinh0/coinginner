import 'package:flutter/material.dart';

import 'package:coinginner_flutter/models/exchanges/exchange.dart';
import 'package:intl/intl.dart';

import '../services/http_exchange_service.dart';

class ExchangeListScreen extends StatelessWidget {
  const ExchangeListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('EXCHANGES'),
            ),
            body: FutureBuilder(
              future: ExchangeService.getExchangeList(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Exchange>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      var exchangeList = snapshot.data;
                      if (exchangeList is List<Exchange>) {
                        return ListView.builder(
                            itemCount: exchangeList.length,
                            itemBuilder: (BuildContext itemContext, int index) {
                              Exchange exchange = exchangeList[index];

                              return Card(
                                  child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Row(children: [
                                  Expanded(
                                      flex: 2,
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          foregroundImage: NetworkImage(
                                              exchange.image ?? ""),
                                          backgroundColor: Colors.pink,
                                        ),
                                        title: Text(exchange.name ?? "",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: ListTile(
                                        title: Text(
                                          '# ' +
                                              exchange.trustScoreRank
                                                  .toString(),
                                          maxLines: 1,
                                        ),
                                        subtitle: Text('24H BTC VOLUME ' +
                                            NumberFormat.compactCurrency(
                                                    decimalDigits: 3,
                                                    symbol: '')
                                                .format(exchange
                                                    .tradeVolume24hBtcNormalized)
                                                .toString()),
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
