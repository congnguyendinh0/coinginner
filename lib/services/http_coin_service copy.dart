//https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=7d

import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

/* class CoinService {
  static String getCryptocurrencyEndpoint({String order = "market_cap_desc"}) {
    return "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=$order&per_page=250&page=1&sparkline=true&price_change_percentage=7d";
  }

  static Future<List<Cryptocurrency>> getCryptocurrencyList(
      {String order = "market_cap_desc"}) async {
    var endpoint =
        CoinService.getCryptocurrencyEndpoint(order: "market_cap_desc");
    Response response = await Dio().get(endpoint);

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
}
 */

class CoinService {
  Future<List<Cryptocurrency>> getCryptocurrencyList(
      {String order = 'market_cap_desc', String currency = 'usd'}) async {
    var response = await Dio().get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currency&order=$order&per_page=250&page=1&sparkline=true&price_change_percentage=7d%2C30d%2C1y');

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
}
