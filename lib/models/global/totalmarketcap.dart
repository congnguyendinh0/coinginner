import 'package:json_annotation/json_annotation.dart';

part 'totalmarketcap.g.dart';

@JsonSerializable()
class TotalMarketCap {
  double? btc;
  double? eur;
  double? usd;
  double? vnd;

  TotalMarketCap({this.btc, this.eur, this.usd, this.vnd});
  factory TotalMarketCap.fromJson(Map<String, dynamic> data) =>
      _$TotalMarketCapFromJson(data);

  Map<String, dynamic> toJson() => _$TotalMarketCapToJson(this);
}
