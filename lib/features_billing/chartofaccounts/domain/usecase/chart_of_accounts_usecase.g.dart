// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_of_accounts_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddChartOfAccountsParamsImpl _$$AddChartOfAccountsParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$AddChartOfAccountsParamsImpl(
      itemId: json['item_id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      code: json['code'] as String? ?? '',
      parentItemId: json['parent_item_id'] as int? ?? 0,
      level: json['level'] as int? ?? 0,
    );

Map<String, dynamic> _$$AddChartOfAccountsParamsImplToJson(
        _$AddChartOfAccountsParamsImpl instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'name': instance.name,
      'code': instance.code,
      'parent_item_id': instance.parentItemId,
      'level': instance.level,
    };
