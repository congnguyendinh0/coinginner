import 'package:coinginner_flutter/models/defi/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'defi.g.dart';

@JsonSerializable(explicitToJson: true)
class Defi {
  Data? data;

  Defi({this.data});
  factory Defi.fromJson(Map<String, dynamic> data) => _$DefiFromJson(data);

  Map<String, dynamic> toJson() => _$DefiToJson(this);
}
