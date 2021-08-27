import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links {
  List<String>? homepage;
  @JsonKey(name: 'twitter_screen_name')
  String? twitterScreenName;

  Links({this.homepage, this.twitterScreenName});
  factory Links.fromJson(Map<String, dynamic> data) => _$LinksFromJson(data);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
