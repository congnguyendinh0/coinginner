import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:coinginner_flutter/models/ethgas/gasoracle.dart';
import 'package:coinginner_flutter/models/trending/trending.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TrendingService {
  // gets the trending coins
  // return a trending
  Future<Trending> getTrending() async {
    var response =
        await Dio().get("https://api.coingecko.com/api/v3/search/trending");
    if (response.statusCode == 200) {
      Trending trending = Trending.fromJson(response.data);
      return trending;
    } else {
      throw Exception("Error");
    }
  }

  // gets the trending coins
  // return list of cryptocurrencies
  Future<List<Cryptocurrency>> getTrendingList({String ids = "url"}) async {
    var response = await Dio().get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=${ids}&order=market_cap_desc&per_page=1&page=1&sparkline=true&price_change_percentage=7d%2C30d%2C1y');

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
