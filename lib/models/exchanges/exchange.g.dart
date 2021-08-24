// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exchange _$ExchangeFromJson(Map<String, dynamic> json) => Exchange(
      id: json['id'] as String?,
      description: json['description'] as String?,
    )
      ..name = json['name'] as String?
      ..image = json['image'] as String?
      ..country = json['country'] as String?
      ..url = json['url'] as String?
      ..yearEstablished = json['year_established'] as int?
      ..trustScoreRank = json['trust_score_rank'] as int?
      ..tradeVolume24hBtcNormalized =
          (json['trade_volume_24h_btc_normalized'] as num?)?.toDouble();

Map<String, dynamic> _$ExchangeToJson(Exchange instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'country': instance.country,
      'url': instance.url,
      'year_established': instance.yearEstablished,
      'trust_score_rank': instance.trustScoreRank,
      'trade_volume_24h_btc_normalized': instance.tradeVolume24hBtcNormalized,
    };
