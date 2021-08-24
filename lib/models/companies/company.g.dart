// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      name: json['name'] as String?,
      totalHoldings: (json['total_holdings'] as num?)?.toDouble(),
      totalCurrentValueUsd:
          (json['total_current_value_usd'] as num?)?.toDouble(),
    )
      ..country = json['country'] as String?
      ..percentageOfTotalSupply =
          (json['percentage_of_total_supply'] as num?)?.toDouble();

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'total_holdings': instance.totalHoldings,
      'country': instance.country,
      'total_current_value_usd': instance.totalCurrentValueUsd,
      'percentage_of_total_supply': instance.percentageOfTotalSupply,
    };
