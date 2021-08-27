// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      defiDominance: (json['defi_dominance'] as num?)?.toDouble(),
    )
      ..defiMarketCap = (json['defi_market_cap'] as num?)?.toDouble()
      ..defiToEthRatio = (json['defi_to_eth_ratio'] as num?)?.toDouble()
      ..topCoinName = json['top_coin_name'] as String?
      ..topCoinDefiDominance =
          (json['top_coin_defi_dominance'] as num?)?.toDouble();

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'defi_market_cap': instance.defiMarketCap,
      'defi_to_eth_ratio': instance.defiToEthRatio,
      'defi_dominance': instance.defiDominance,
      'top_coin_name': instance.topCoinName,
      'top_coin_defi_dominance': instance.topCoinDefiDominance,
    };
