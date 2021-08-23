import 'package:json_annotation/json_annotation.dart';
import 'package:coinginner_flutter/models/coinextra/description.dart';
import 'package:coinginner_flutter/models/coinextra/description.dart';

part 'coinextra.g.dart';

@JsonSerializable(explicitToJson: true)
class Coinextra {
  String? id;
  Description? description;

  Coinextra({this.id, this.description});
  factory Coinextra.fromJson(Map<String, dynamic> data) =>
      _$CoinextraFromJson(data);

  Map<String, dynamic> toJson() => _$CoinextraToJson(this);
}
