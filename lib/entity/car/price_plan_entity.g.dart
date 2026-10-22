// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_plan_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PricePlanEntity _$PricePlanEntityFromJson(Map<String, dynamic> json) =>
    PricePlanEntity()
      ..id = (json['id'] as num?)?.toDouble()
      ..link = json['link'] as String?
      ..name = json['name'] as String?
      ..value = json['value'] as String?
      ..order = (json['order'] as num?)?.toDouble()
      ..visible = (json['visible'] as num?)?.toDouble();

Map<String, dynamic> _$PricePlanEntityToJson(PricePlanEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'value': instance.value,
      'order': instance.order,
      'visible': instance.visible,
    };
