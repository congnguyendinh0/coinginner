import 'package:coinginner_flutter/models/ethgas/gasoracle.dart';
import 'package:coinginner_flutter/models/trending/trending.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TrendingService {
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
}
