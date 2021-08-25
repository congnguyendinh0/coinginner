import 'package:coinginner_flutter/models/companies/publictreasury.dart';
import 'package:coinginner_flutter/screens/exchange_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'package:coinginner_flutter/models/cryptocurrency.dart';

import 'package:coinginner_flutter/models/coinextra/coinextra.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CoinDetailScreen extends StatelessWidget {
  static Future<Coinextra> getCoinextra({String id = "bitcoin"}) async {
    var response = await Dio().get(
        "https://api.coingecko.com/api/v3/coins/${id}?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false");

    if (response.statusCode == 200) {
      Coinextra coinextra = Coinextra.fromJson(response.data);
      return coinextra;
    } else {
      throw Exception("Error");
    }
  }

  static Future<PublicTreasury> getPublicTreasury(
      {String name = "bitcoin"}) async {
    var response = await Dio().get(
        "https://api.coingecko.com/api/v3/companies/public_treasury/${name}");

    if (response.statusCode == 200) {
      PublicTreasury publicTreasury = PublicTreasury.fromJson(response.data);
      return publicTreasury;
    } else {
      throw Exception("Error");
    }
  }

  final Cryptocurrency cryptocurrency;
  const CoinDetailScreen({Key? key, required this.cryptocurrency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // convert sparkline list dynamic to list double
    List<dynamic> sparkLine = cryptocurrency.sparkline["price"];
    var data = sparkLine.cast<double>();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              foregroundImage: NetworkImage(cryptocurrency.image),
              backgroundColor: Colors.purple,
              radius: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 5),
                child: Text(
                  cryptocurrency.name +
                      "(" +
                      cryptocurrency.symbol +
                      ")"
                          " #" +
                      cryptocurrency.marketCapRank.toInt().toString(),
                  style:
                      TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.bookmark_add),
            tooltip: 'save',
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Row(children: [
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 5, 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor:
                              cryptocurrency.priceChangePercentage24h > 0
                                  ? Colors.teal
                                  : Color(0xffF72585),
                          onSurface: Colors.grey,
                          textStyle: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        onPressed: () {},
                        child: cryptocurrency.priceChangePercentage24h > 0
                            ? Text('\u{25B2}' +
                                cryptocurrency.priceChangePercentage24h
                                    .toStringAsFixed(2) +
                                '%')
                            : Text('\u{25BC}' +
                                cryptocurrency.priceChangePercentage24h
                                    .toStringAsFixed(2) +
                                '%'),
                      ),
                    ),
                  ]),
                  SfSparkLineChart(
                      axisLineColor: Colors.white,
                      axisLineDashArray: <double>[10, 3],
                      trackball: SparkChartTrackball(
                          activationMode: SparkChartActivationMode.tap),
                      data: data,
                      color: Colors.white),
                ],
              ),
            ),
            FutureBuilder<Coinextra>(
              future: getCoinextra(id: cryptocurrency.id),
              builder:
                  (BuildContext context, AsyncSnapshot<Coinextra> snapshot) {
                if (snapshot.hasData) {
                  var coinextra = snapshot.data;
                  if (coinextra != null) {
                    var text = coinextra.description;
                    //return Text(text?.en ?? "");
                    var categories = coinextra.categories;
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffF72585)),
                              onPressed: () {
                                Get.to(ExchangeListScreen());
                              },
                              child: const Text('BUY ON THESE EXCHANGES',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ),
                        ExpansionTile(
                          title: Text(
                              'ABOUT ${cryptocurrency.name.toUpperCase()}',
                              style: TextStyle(color: Colors.white)),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(

                                  // https://stackoverflow.com/questions/51593790/remove-html-tags-from-a-string-in-dart
                                  text?.en?.replaceAll(
                                          RegExp(r'<[^>]*>|&[^;]+;'), '') ??
                                      "",
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                        //Text(coinextra.genesisDate ?? ""),
                        Divider(),

                        ExpansionTile(
                            title: Text('CATEGORIES',
                                style: TextStyle(color: Colors.white)),
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    for (var item in categories ?? [])
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Expanded(
                                          child: Chip(
                                              label: Text(item,
                                                  style:
                                                      TextStyle(fontSize: 8))),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ]),
/*                         //if (cryptocurrency.id == 'bitcoin') {}
                        if (cryptocurrency.name.toLowerCase() == 'bitcoin' ||
                            cryptocurrency.name.toLowerCase() == 'ethereum')
                          FutureBuilder<PublicTreasury>(
                              future:
                                  getPublicTreasury(name: cryptocurrency.name),
                              builder: (BuildContext context,
                                  AsyncSnapshot<PublicTreasury> snapshot) {
                                if (snapshot.hasData) {
                                  var publictreasury = snapshot.data;
                                  return ExpansionTile(
                                    title: Text(
                                        'Companies that own ${cryptocurrency.name}'),
                                    children: [
                                      Expanded(
                                        child: DataTable(columns: [
                                          DataColumn(
                                              label: Text('total holdings')),
                                          DataColumn(
                                              label: Text('total Value Usd'))
                                        ], rows: [
                                          DataRow(cells: [
                                            DataCell(Text(publictreasury!
                                                .totalHoldings
                                                .toString())),
                                            DataCell(Text(publictreasury
                                                .totalValueUsd
                                                .toString()))
                                          ])
                                        ]),
                                      )
                                    ],
                                  );
                                }
                                return const Text("");
                              })
                        else
                          Text('') */
                      ],
                    );
                  }
                }
                return const Text("");
              },
            )
          ]),
        ),
      ),
    );
  }
}
