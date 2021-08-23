import 'package:json_annotation/json_annotation.dart';

part 'marketcappercentage.g.dart';

@JsonSerializable()
class MarketCapPercentage {
  double? btc;
  double? eth;
  double? ada;
  double? bnb;
  double? usdt;

  MarketCapPercentage({this.btc, this.eth, this.ada, this.bnb, this.usdt});
  factory MarketCapPercentage.fromJson(Map<String, dynamic> data) =>
      _$MarketCapPercentageFromJson(data);

  Map<String, dynamic> toJson() => _$MarketCapPercentageToJson(this);
}
