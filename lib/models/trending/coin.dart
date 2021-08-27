import 'package:coinginner_flutter/models/trending/item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin.g.dart';

@JsonSerializable(explicitToJson: true)
class Coin {
  Item? item;

  Coin({this.item});
  factory Coin.fromJson(Map<String, dynamic> data) => _$CoinFromJson(data);

  Map<String, dynamic> toJson() => _$CoinToJson(this);
}
