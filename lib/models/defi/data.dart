import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  @JsonKey(name: 'defi_market_cap')
  double? defiMarketCap;
  @JsonKey(name: 'defi_to_eth_ratio')
  double? defiToEthRatio;
  @JsonKey(name: 'defi_dominance')
  double? defiDominance;
  @JsonKey(name: 'top_coin_name')
  String? topCoinName;
  @JsonKey(name: 'top_coin_defi_dominance')
  double? topCoinDefiDominance;

  Data({this.defiDominance});
  factory Data.fromJson(Map<String, dynamic> data) => _$DataFromJson(data);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
