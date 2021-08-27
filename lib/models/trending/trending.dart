import 'package:json_annotation/json_annotation.dart';
import 'package:coinginner_flutter/models/trending/coin.dart';

part 'trending.g.dart';

@JsonSerializable(explicitToJson: true)
class Trending {
  List<Coin>? coins;

  Trending({this.coins});
  factory Trending.fromJson(Map<String, dynamic> data) =>
      _$TrendingFromJson(data);

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}
