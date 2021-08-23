import 'package:json_annotation/json_annotation.dart';
import 'package:coinginner_flutter/models/coinextra/description.dart';

part 'exchange.g.dart';

@JsonSerializable()
class Exchange {
  String? id;
  String? name;
  String? description;
  String? image;
  String? country;
  String? url;

  @JsonKey(name: 'year_established')
  double? yearEstablished;

  @JsonKey(name: 'trust_score_rank')
  double? trustScoreRank;

  @JsonKey(name: 'trade_volume_24h_btc_normalized')
  double? tradeVolume24hBtcNormalized;

  Exchange({this.id, this.description});
  factory Exchange.fromJson(Map<String, dynamic> data) =>
      _$ExchangeFromJson(data);

  Map<String, dynamic> toJson() => _$ExchangeToJson(this);
}
