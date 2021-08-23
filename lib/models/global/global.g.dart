// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Global _$GlobalFromJson(Map<String, dynamic> json) => Global(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GlobalToJson(Global instance) => <String, dynamic>{
      'data': instance.data?.toJson(),
    };
