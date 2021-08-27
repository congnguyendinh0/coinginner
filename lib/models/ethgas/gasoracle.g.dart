// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gasoracle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GasOracle _$GasOracleFromJson(Map<String, dynamic> json) => GasOracle(
      status: json['status'] as String?,
    )
      ..message = json['message'] as String?
      ..result = json['result'] == null
          ? null
          : Result.fromJson(json['result'] as Map<String, dynamic>);

Map<String, dynamic> _$GasOracleToJson(GasOracle instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'result': instance.result?.toJson(),
    };
