// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_profile_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerParamsImpl _$$CustomerParamsImplFromJson(Map<String, dynamic> json) =>
    _$CustomerParamsImpl(
      cusId: json['cus_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      country: json['country'] as String? ?? '',
      address: json['company_address'] as String? ?? '',
      tradingLicenseNumber: json['trading_license_no'] as String? ?? '',
      password: json['password'] as String? ?? '',
      companyName: json['company_name'] as String? ?? '',
    );

Map<String, dynamic> _$$CustomerParamsImplToJson(
        _$CustomerParamsImpl instance) =>
    <String, dynamic>{
      'cus_id': instance.cusId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'country': instance.country,
      'company_address': instance.address,
      'trading_license_no': instance.tradingLicenseNumber,
      'password': instance.password,
      'company_name': instance.companyName,
    };
