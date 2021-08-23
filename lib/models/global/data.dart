import 'package:json_annotation/json_annotation.dart';
import 'package:coinginner_flutter/models/global/totalmarketcap.dart';
import 'package:coinginner_flutter/models/global/marketcappercentage.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  @JsonKey(name: 'active_cryptocurrencies')
  double? activeCryptocurrencies;

  @JsonKey(name: 'markets')
  double? markets;

  @JsonKey(name: 'market_cap_change_percentage_24h_usd')
  double? marketCapChangePercentage24hUsd;

  @JsonKey(name: 'upcoming_icos')
  double? upcomingIcos;

  @JsonKey(name: 'ongoing_icos')
  double? ongoingIcos;

  @JsonKey(name: 'total_market_cap')
  TotalMarketCap? totalMarketCap;

  @JsonKey(name: 'market_cap_percentage')
  MarketCapPercentage? marketCapPercentage;

  Data(
      {this.activeCryptocurrencies,
      this.markets,
      this.marketCapChangePercentage24hUsd,
      this.upcomingIcos,
      this.ongoingIcos,
      this.marketCapPercentage,
      this.totalMarketCap});
  factory Data.fromJson(Map<String, dynamic> data) => _$DataFromJson(data);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
