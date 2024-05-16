// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_inventory_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdminTrackingParamsImpl _$$AdminTrackingParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$AdminTrackingParamsImpl(
      vinNumber: json['vin_number'] as String? ?? '',
      lotNumber: json['lot_number'] as String? ?? '',
    );

Map<String, dynamic> _$$AdminTrackingParamsImplToJson(
        _$AdminTrackingParamsImpl instance) =>
    <String, dynamic>{
      'vin_number': instance.vinNumber,
      'lot_number': instance.lotNumber,
    };
