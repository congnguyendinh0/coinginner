import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'package:coinginner_flutter/models/cryptocurrency.dart';

import 'package:coinginner_flutter/models/coinextra/coinextra.dart';
import 'package:dio/dio.dart';

class CoinDetailScreen extends StatelessWidget {
  static Future<Coinextra> getCoinextra({String id = "bitcoin"}) async {
    Response response = await Dio().get(
        "https://api.coingecko.com/api/v3/coins/${id}?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false");

    if (response.statusCode == 200) {
      Coinextra coinextra = Coinextra.fromJson(response.data);
      return coinextra;
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
        title: Text(cryptocurrency.name +
            "(" +
            cryptocurrency.symbol +
            ")"
                "#" +
            cryptocurrency.marketCapRank.toInt().toString()),
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
          child: Column(children: [
            SfSparkAreaChart(
                trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                data: data,
                color: Colors.black),
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              for (var item in categories ?? [])
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Chip(label: Text(item)),
                                )
                            ],
                          ),
                        ),
                        Divider(),
                        ExpansionTile(
                          title: Text(
                            'Description',
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(text?.en ?? ""),
                            )
                          ],
                        ),
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
