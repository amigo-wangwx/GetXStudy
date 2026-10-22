import 'package:json_annotation/json_annotation.dart';

part 'price_plan_entity.g.dart';

@JsonSerializable()
class PricePlanEntity {
  double? id;
  String? link;
  String? name;
  String? value;
  double? order;
  double? visible;

  PricePlanEntity();

  factory PricePlanEntity.fromJson(Map<String, dynamic> json) =>
      _$PricePlanEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PricePlanEntityToJson(this);
}
