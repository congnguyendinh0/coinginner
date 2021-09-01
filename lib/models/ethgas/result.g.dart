// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      lastBlock: json['LastBlock'] as String?,
      safeGasPrice: json['SafeGasPrice'] as String?,
      proposeGasPrice: json['ProposeGasPrice'] as String?,
      fastGasPrice: json['FastGasPrice'] as String?,
      suggestBaseFee: json['SuggestBaseFee'] as String?,
      gasUsedRatio: json['GasUsedRatio'] as String?,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'LastBlock': instance.lastBlock,
      'SafeGasPrice': instance.safeGasPrice,
      'ProposeGasPrice': instance.proposeGasPrice,
      'FastGasPrice': instance.fastGasPrice,
      'SuggestBaseFee': instance.suggestBaseFee,
      'GasUsedRatio': instance.gasUsedRatio,
    };
