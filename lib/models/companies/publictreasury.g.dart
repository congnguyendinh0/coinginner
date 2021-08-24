// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publictreasury.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicTreasury _$PublicTreasuryFromJson(Map<String, dynamic> json) =>
    PublicTreasury(
      totalValueUsd: (json['total_value_usd'] as num?)?.toDouble(),
      totalHoldings: (json['total_holdings'] as num?)?.toDouble(),
      companies: (json['companies'] as List<dynamic>?)
          ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PublicTreasuryToJson(PublicTreasury instance) =>
    <String, dynamic>{
      'companies': instance.companies?.map((e) => e.toJson()).toList(),
      'total_holdings': instance.totalHoldings,
      'total_value_usd': instance.totalValueUsd,
    };
