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
      subRedditUrl: json['subreddit_url'] as String?,
      telegram: json['telegram_channel_identifier'] as String?,
      blockchainsite: (json['blockchain_site'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'homepage': instance.homepage,
      'blockchain_site': instance.blockchainsite,
      'twitter_screen_name': instance.twitterScreenName,
      'subreddit_url': instance.subRedditUrl,
      'telegram_channel_identifier': instance.telegram,
    };
