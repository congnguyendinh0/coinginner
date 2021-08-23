import 'package:json_annotation/json_annotation.dart';

part 'description.g.dart';

@JsonSerializable()
class Description {
  String? en;

  Description({this.en});
  factory Description.fromJson(Map<String, dynamic> data) =>
      _$DescriptionFromJson(data);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}
