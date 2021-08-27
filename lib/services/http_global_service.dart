import 'package:coinginner_flutter/models/global/global.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GlobalService {
  static Future<Global> getGlobal() async {
    var response = await Dio().get("https://api.coingecko.com/api/v3/global");

    if (response.statusCode == 200) {
      Global global = Global.fromJson(response.data);
      return global;
    } else {
      throw Exception("Error");
    }
  }
}
