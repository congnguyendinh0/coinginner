import 'package:coinginner_flutter/models/cryptocurrency.dart';
import 'package:dio/dio.dart';

class WatchListService {
  //  return cryptoCurrencyList a list of crypto Currency
  Future<List<Cryptocurrency>> getWatchList(
      {String order = 'market_cap_desc',
      String currency = 'usd',
      String ids = 'bitcoin'}) async {
    var response = await Dio().get(
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=$currency&ids=$ids&order=$order&per_page=250&page=1&sparkline=false&price_change_percentage=7d%2C30d%2C1y');

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
