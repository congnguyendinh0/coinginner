import 'package:coinginner_flutter/models/ethgas/gasoracle.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GasService {
  static Future<GasOracle> getFee() async {
    // get key from .env
    // returns an gasoracle
    // we need the key to work with this api
    String key = dotenv.get('KEY');
    var response = await Dio().get(
        "https://api.etherscan.io/api?module=gastracker&action=gasoracle&apikey=$key");

    if (response.statusCode == 200) {
      // builds new  gasoracle from the response data
      GasOracle gasOracle = GasOracle.fromJson(response.data);
      return gasOracle;
    } else {
      throw Exception("Error");
    }
  }
}
