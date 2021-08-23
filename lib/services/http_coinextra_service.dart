import 'package:coinginner_flutter/models/coinextra/coinextra.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class CoinextraService {
  static String get COINEXTRA {
    return "https://api.coingecko.com/api/v3/coins/ethereum?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false";
  }

  static Future<Coinextra> getCoinextra() async {
    Response response = await Dio().get(CoinextraService.COINEXTRA);

    if (response.statusCode == 200) {
      Coinextra coinextra = Coinextra.fromJson(response.data);
      return coinextra;
    } else {
      throw Exception("Error");
    }
  }
}
