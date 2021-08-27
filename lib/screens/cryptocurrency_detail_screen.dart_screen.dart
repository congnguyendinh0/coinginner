import 'package:coinginner_flutter/models/companies/publictreasury.dart';
import 'package:coinginner_flutter/screens/exchange_list_screen.dart';
import 'package:coinginner_flutter/screens/glossary_screen.dart';
import 'package:coinginner_flutter/screens/search_screen.dart';
import 'package:coinginner_flutter/services/http_coinextra_service.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'package:coinginner_flutter/models/cryptocurrency.dart';

import 'package:coinginner_flutter/models/coinextra/coinextra.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CoinDetailScreen extends StatelessWidget {
  static Future<PublicTreasury> getPublicTreasury(
      {String id = "bitcoin"}) async {
    var response = await Dio().get(
        "https://api.coingecko.com/api/v3/companies/public_treasury/${id}");

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
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'search',
            onPressed: () {
              Get.to(SearchScreen());
            },
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
                    Expanded(
                        child: ListTile(
                      title: Text(
                        cryptocurrency.currentPrice.toStringAsFixed(4),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    Column(
                      children: [
                        Text(
                          'TODAY',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 5, 10),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size(30, 30),
                              padding: EdgeInsets.all(5),
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
                      ],
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50.0),
                    child: SfSparkLineChart(
                        axisLineColor: Colors.white,
                        axisLineDashArray: <double>[10, 3],
                        trackball: SparkChartTrackball(
                            activationMode: SparkChartActivationMode.tap),
                        data: data,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            FutureBuilder<Coinextra>(
              future: CoinextraService.getCoinextra(id: cryptocurrency.id),
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

                                  // replaces all html tags
                                  // https://stackoverflow.com/questions/51593790/remove-html-tags-from-a-string-in-dart
                                  text?.en?.replaceAll(
                                          RegExp(r'<[^>]*>|&[^;]+;'), '') ??
                                      "",
                                  style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
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
                                    for (var category in categories ?? [])
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Expanded(
                                          child: Chip(
                                              label: Text(category,
                                                  style:
                                                      TextStyle(fontSize: 8))),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ]),
                        ExpansionTile(
                          title: Text('LINKS',
                              style: TextStyle(color: Colors.white)),
                          children: [
                            ListTile(
                                title: Text("HOMEPAGE",
                                    style: TextStyle(color: Colors.white)),
                                subtitle: Text(coinextra.links!.homepage![0],
                                    style: TextStyle(color: Colors.white))),
                            ListTile(
                                title: Text("TWITTER",
                                    style: TextStyle(color: Colors.white)),
                                subtitle: Text(
                                    "@" + coinextra.links!.twitterScreenName!,
                                    style: TextStyle(color: Colors.white)))
                          ],
                        ),
                        ListTile(
                          title: Text(
                            'MARKET CAP',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            NumberFormat.compactCurrency(
                                    decimalDigits: 4, symbol: '')
                                .format(cryptocurrency.marketCap),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'TRADING VOLUME',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(NumberFormat.compactCurrency(
                                  decimalDigits: 4, symbol: "")
                              .format(cryptocurrency.totalVolume)),
                        ),
                        ListTile(
                          title: Text(
                            'CIRCULATING SUPPLY',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle:
                              Text(cryptocurrency.circulatingSupply.toString()),
                        ),
                        ListTile(
                          title: Text(
                            'TOTAL SUPPLY',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(cryptocurrency.totalSupply.toString()),
                        ),
                      ],
                    );
                  }
                }
                return const Text("");
              },
            ),
            FutureBuilder<PublicTreasury>(
              future: getPublicTreasury(id: cryptocurrency.id),
              builder: (BuildContext context,
                  AsyncSnapshot<PublicTreasury> snapshot) {
                if (snapshot.hasData) {
                  var publicTreasury = snapshot.data;
                  var companies = publicTreasury!.companies;
                  if (publicTreasury != null) {
                    return Column(
                      children: [
                        Column(
                          children: [
                            ListTile(
                                title: Text('Public Treasury'),
                                subtitle: Text(
                                    '''TOTAL VALUE: ${publicTreasury.totalValueUsd}USD \nTOTAL HOLDINGS: ${publicTreasury.totalHoldings}BTC 
                                    ''')),
                          ],
                        ),
                        ExpansionTile(
                          title:
                              Text("COMPANIES THAT OWN ${cryptocurrency.name}"),
                          children: [
                            for (var company in companies!)
                              ListTile(
                                  title: Text(company.name!),
                                  subtitle: Text(
                                      "TOTAL HOLDINGS:${company.totalHoldings.toString()}\nPERCENTAGE OF TOTAL SUPPLY: ${company.percentageOfTotalSupply}"))
                          ],
                        )
                      ],
                    );
                  }
                }
                return const Text("");
              },
            ),
            Container(
              margin: EdgeInsets.all(10),
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Color(0xffF72585)),
                  onPressed: () {
                    Get.to(GlossaryScreen());
                  },
                  child: const Text("DONT'T UNDERSTAND A TERM?",
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ),
          ]),
        ),
      ),
    );
  }
}
