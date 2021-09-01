import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links {
  List<String>? homepage;
  @JsonKey(name: 'blockchain_site')
  List<String>? blockchainsite;
  @JsonKey(name: 'twitter_screen_name')
  String? twitterScreenName;
  @JsonKey(name: 'subreddit_url')
  String? subRedditUrl;
  @JsonKey(name: 'telegram_channel_identifier')
  String? telegram;

  Links(
      {this.homepage,
      this.twitterScreenName,
      this.subRedditUrl,
      this.telegram,
      this.blockchainsite});
  factory Links.fromJson(Map<String, dynamic> data) => _$LinksFromJson(data);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
