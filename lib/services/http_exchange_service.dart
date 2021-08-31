import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:coinginner_flutter/models/exchanges/exchange.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class ExchangeService {
  static String get EXCHANGES {
    return "https://api.coingecko.com/api/v3/exchanges?per_page=10&page=1";
  }

  static Future<List<Exchange>> getExchangeList() async {
    Response response = await Dio().get(ExchangeService.EXCHANGES);

    if (response.statusCode == 200) {
      List<dynamic> responseList = response.data;
      List<Exchange> exchangeList = [];
      for (var i = 0; i < responseList.length; i++) {
        exchangeList.add(Exchange.fromJson(responseList[i]));
      }
      return exchangeList;
      // return cryptocurrencyList.map((e) => Cryptocurrency.fromJSON(e)).toList();
    } else {
      throw Exception("Error");
    }
  }
}
