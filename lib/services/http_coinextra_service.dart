import 'package:coinginner_flutter/models/coinextra/coinextra.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class CoinextraService {
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
}
