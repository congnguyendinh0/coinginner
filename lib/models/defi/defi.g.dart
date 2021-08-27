// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'defi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Defi _$DefiFromJson(Map<String, dynamic> json) => Defi(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DefiToJson(Defi instance) => <String, dynamic>{
      'data': instance.data,
    };
