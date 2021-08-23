import 'package:json_annotation/json_annotation.dart';
import 'package:coinginner_flutter/models/global/data.dart';

part 'global.g.dart';

@JsonSerializable(explicitToJson: true)
class Global {
  Data? data;

  Global({this.data});
  factory Global.fromJson(Map<String, dynamic> data) => _$GlobalFromJson(data);

  Map<String, dynamic> toJson() => _$GlobalToJson(this);
}
