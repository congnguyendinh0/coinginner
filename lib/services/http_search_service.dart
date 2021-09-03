import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:dio/dio.dart';

class SearchService {
  Future<List<Cryptocurrency>> getSearch({String id = "bitcoin"}) async {
    var response = await Dio().get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=${id}&order=market_cap_desc&per_page=1&page=1&sparkline=true&price_change_percentage=7d%2C30d%2C1y');

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
