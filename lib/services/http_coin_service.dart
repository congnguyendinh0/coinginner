//https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=7d

import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class CoinService {
  static String get CRYPTOCURRENCIES {
    return "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=7d";
  }

  static Future<List<Cryptocurrency>> getCryptocurrencyList() async {
    Response response = await Dio().get(CoinService.CRYPTOCURRENCIES);

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