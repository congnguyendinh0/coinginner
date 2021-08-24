import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'total_holdings')
  double? totalHoldings;

  String? country;

  @JsonKey(name: 'total_current_value_usd')
  double? totalCurrentValueUsd;

  @JsonKey(name: 'percentage_of_total_supply')
  double? percentageOfTotalSupply;

  Company({this.name, this.totalHoldings, this.totalCurrentValueUsd});
  factory Company.fromJson(Map<String, dynamic> data) =>
      _$CompanyFromJson(data);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
