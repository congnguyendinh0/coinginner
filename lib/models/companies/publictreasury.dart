import 'package:json_annotation/json_annotation.dart';
import 'package:coinginner_flutter/models/companies/company.dart';

part 'publictreasury.g.dart';

@JsonSerializable(explicitToJson: true)
class PublicTreasury {
  @JsonKey(name: 'companies')
  List<Company>? companies;

  @JsonKey(name: 'total_holdings')
  double? totalHoldings;

  @JsonKey(name: 'total_value_usd')
  double? totalValueUsd;

  PublicTreasury({this.totalValueUsd, this.totalHoldings, this.companies});
  factory PublicTreasury.fromJson(Map<String, dynamic> data) =>
      _$PublicTreasuryFromJson(data);

  Map<String, dynamic> toJson() => _$PublicTreasuryToJson(this);
}
