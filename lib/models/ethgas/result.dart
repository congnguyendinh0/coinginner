import 'package:coinginner_flutter/models/defi/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'LastBlock')
  String? lastBlock;
  @JsonKey(name: 'SafeGasPrice')
  String? safeGasPrice;
  @JsonKey(name: 'ProposeGasPrice')
  String? proposeGasPrice;
  @JsonKey(name: 'FastGasPrice')
  String? fastGasPrice;
  @JsonKey(name: 'SuggestBaseFee')
  String? suggestBaseFee;
  @JsonKey(name: 'GasUsedRatio')
  String? gasUsedRatio;

  Result(
      {this.lastBlock,
      this.safeGasPrice,
      this.proposeGasPrice,
      this.fastGasPrice,
      this.suggestBaseFee,
      this.gasUsedRatio});
  factory Result.fromJson(Map<String, dynamic> data) => _$ResultFromJson(data);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
