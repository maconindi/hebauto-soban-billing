// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_inventory_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackingParamsImpl _$$TrackingParamsImplFromJson(Map<String, dynamic> json) =>
    _$TrackingParamsImpl(
      vinNumber: json['vin_number'] as String? ?? '',
      lotNumber: json['lot_number'] as String? ?? '',
    );

Map<String, dynamic> _$$TrackingParamsImplToJson(
        _$TrackingParamsImpl instance) =>
    <String, dynamic>{
      'vin_number': instance.vinNumber,
      'lot_number': instance.lotNumber,
    };
