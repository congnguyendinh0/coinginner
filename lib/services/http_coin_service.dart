//https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=7d

import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:dio/dio.dart';

class CoinService {
  static String get CRYPTOCURRENCIES {
    return "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&price_change_percentage=7d";
  }

  static Future<List<Cryptocurrency>> getCryptocurrencyList() async {
    var response = await Dio().get(CoinService.CRYPTOCURRENCIES);
    if (response.statusCode == 200) {
      Map<String, dynamic> body = response.data as Map<String, dynamic>;
      var json = body["cryptocurrency"];
      List<Cryptocurrency> cryptocurrencyList = [];
      for (var i = 0; i < json.length; i++) {
        var coin = Cryptocurrency.fromJSON(json[i]);
        cryptocurrencyList.add(coin);
      }
      return cryptocurrencyList;
    } else {
      throw Exception("Error");
    }
  }
}
