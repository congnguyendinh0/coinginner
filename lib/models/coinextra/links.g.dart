// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      homepage: (json['homepage'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      twitterScreenName: json['twitter_screen_name'] as String?,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'homepage': instance.homepage,
      'twitter_screen_name': instance.twitterScreenName,
    };
