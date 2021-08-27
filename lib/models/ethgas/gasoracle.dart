import 'package:coinginner_flutter/models/defi/data.dart';
import 'package:coinginner_flutter/models/ethgas/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gasoracle.g.dart';

@JsonSerializable(explicitToJson: true)
class GasOracle {
  String? status;
  String? message;
  Result? result;

  GasOracle({this.status});
  factory GasOracle.fromJson(Map<String, dynamic> data) =>
      _$GasOracleFromJson(data);

  Map<String, dynamic> toJson() => _$GasOracleToJson(this);
}
