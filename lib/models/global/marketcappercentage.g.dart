// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketcappercentage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketCapPercentage _$MarketCapPercentageFromJson(Map<String, dynamic> json) =>
    MarketCapPercentage(
      btc: (json['btc'] as num?)?.toDouble(),
      eth: (json['eth'] as num?)?.toDouble(),
      ada: (json['ada'] as num?)?.toDouble(),
      bnb: (json['bnb'] as num?)?.toDouble(),
      usdt: (json['usdt'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MarketCapPercentageToJson(
        MarketCapPercentage instance) =>
    <String, dynamic>{
      'btc': instance.btc,
      'eth': instance.eth,
      'ada': instance.ada,
      'bnb': instance.bnb,
      'usdt': instance.usdt,
    };
