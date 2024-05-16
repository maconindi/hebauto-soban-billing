// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryParamsImpl _$$InventoryParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryParamsImpl(
      inventId: json['invent_id'] as String? ?? '',
      invoiceNo: json['invoice_no'] as String? ?? '',
      cusId: json['cus_id'] as int? ?? 0,
      cusEmail: json['cus_email'] as String? ?? '',
      invoiceUrl: json['invoice_url'] as String? ?? '',
      auctionName: json['auction_name'] as String? ?? '',
      bookingNo: json['booking_no'] as String? ?? '',
      towingLocation: json['towing_location'] as String? ?? '',
      departurePort: json['departure_port'] as String? ?? '',
      offloadingPort: json['offloading_port'] as String? ?? '',
      shipContainerNo: json['ship_container_no'] as String? ?? '',
      deliveryStatus: json['delivery_status'] as String? ?? '',
      exptShippingDate: json['expt_shipping_date'] as String? ?? '',
      exptArrivalDate: json['expt_arrival_date'] as String? ?? '',
      actArrivalDate: json['act_arrival_date'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      vehicleName: json['vehicle_name'] as String? ?? '',
      vinNumber: json['vin_number'] as String? ?? '',
      lotNumber: json['lot_number'] as String? ?? '',
      color: json['color'] as String? ?? '',
      isKey: json['is_key'] as bool? ?? false,
    );

Map<String, dynamic> _$$InventoryParamsImplToJson(
        _$InventoryParamsImpl instance) =>
    <String, dynamic>{
      'invent_id': instance.inventId,
      'invoice_no': instance.invoiceNo,
      'cus_id': instance.cusId,
      'cus_email': instance.cusEmail,
      'invoice_url': instance.invoiceUrl,
      'auction_name': instance.auctionName,
      'booking_no': instance.bookingNo,
      'towing_location': instance.towingLocation,
      'departure_port': instance.departurePort,
      'offloading_port': instance.offloadingPort,
      'ship_container_no': instance.shipContainerNo,
      'delivery_status': instance.deliveryStatus,
      'expt_shipping_date': instance.exptShippingDate,
      'expt_arrival_date': instance.exptArrivalDate,
      'act_arrival_date': instance.actArrivalDate,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'vehicle_name': instance.vehicleName,
      'vin_number': instance.vinNumber,
      'lot_number': instance.lotNumber,
      'color': instance.color,
      'is_key': instance.isKey,
    };
