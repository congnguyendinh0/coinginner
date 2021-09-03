import 'package:coinginner_flutter/models/companies/publictreasury.dart';
import 'package:dio/dio.dart';

class PublicTreasuryService {
  Future<PublicTreasury> getPublicTreasury({String id = "bitcoin"}) async {
    var response = await Dio().get(
        "https://api.coingecko.com/api/v3/companies/public_treasury/${id}");

    if (response.statusCode == 200) {
      PublicTreasury publicTreasury = PublicTreasury.fromJson(response.data);
      return publicTreasury;
    } else {
      throw Exception("Error");
    }
  }
}
