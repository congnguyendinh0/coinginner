// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      activeCryptocurrencies:
          (json['active_cryptocurrencies'] as num?)?.toDouble(),
      markets: (json['markets'] as num?)?.toDouble(),
      marketCapChangePercentage24hUsd:
          (json['market_cap_change_percentage_24h_usd'] as num?)?.toDouble(),
      upcomingIcos: (json['upcoming_icos'] as num?)?.toDouble(),
      ongoingIcos: (json['ongoing_icos'] as num?)?.toDouble(),
      marketCapPercentage: json['market_cap_percentage'] == null
          ? null
          : MarketCapPercentage.fromJson(
              json['market_cap_percentage'] as Map<String, dynamic>),
      totalMarketCap: json['total_market_cap'] == null
          ? null
          : TotalMarketCap.fromJson(
              json['total_market_cap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'active_cryptocurrencies': instance.activeCryptocurrencies,
      'markets': instance.markets,
      'market_cap_change_percentage_24h_usd':
          instance.marketCapChangePercentage24hUsd,
      'upcoming_icos': instance.upcomingIcos,
      'ongoing_icos': instance.ongoingIcos,
      'total_market_cap': instance.totalMarketCap?.toJson(),
      'market_cap_percentage': instance.marketCapPercentage?.toJson(),
    };
