// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'totalmarketcap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TotalMarketCap _$TotalMarketCapFromJson(Map<String, dynamic> json) =>
    TotalMarketCap(
      btc: (json['btc'] as num?)?.toDouble(),
      eur: (json['eur'] as num?)?.toDouble(),
      usd: (json['usd'] as num?)?.toDouble(),
      vnd: (json['vnd'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TotalMarketCapToJson(TotalMarketCap instance) =>
    <String, dynamic>{
      'btc': instance.btc,
      'eur': instance.eur,
      'usd': instance.usd,
      'vnd': instance.vnd,
    };
