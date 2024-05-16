// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricelist_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceListParamsImpl _$$PriceListParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$PriceListParamsImpl(
      url: json['url'] as String? ?? '',
      cusEmail: json['cus_email'] as String? ?? '',
      cusName: json['cus_name'] as String? ?? '',
      cusCompany: json['cus_company'] as String? ?? '',
      cusId: json['cus_id_fk'] as String? ?? '',
    );

Map<String, dynamic> _$$PriceListParamsImplToJson(
        _$PriceListParamsImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'cus_email': instance.cusEmail,
      'cus_name': instance.cusName,
      'cus_company': instance.cusCompany,
      'cus_id_fk': instance.cusId,
    };
