// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coinextra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coinextra _$CoinextraFromJson(Map<String, dynamic> json) => Coinextra(
      id: json['id'] as String?,
      description: json['description'] == null
          ? null
          : Description.fromJson(json['description'] as Map<String, dynamic>),
    )
      ..categories = (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..genesisDate = json['genesis_date'] as String?;

Map<String, dynamic> _$CoinextraToJson(Coinextra instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description?.toJson(),
      'categories': instance.categories,
      'genesis_date': instance.genesisDate,
    };
