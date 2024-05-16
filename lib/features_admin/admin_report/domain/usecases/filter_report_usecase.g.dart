// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_report_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterReportParamsImpl _$$FilterReportParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$FilterReportParamsImpl(
      carStatus: json['carStatus'] as String? ?? '',
      paymentStatus: json['paymentStatus'] as String? ?? '',
      customerName: json['customerName'] as String? ?? '',
      startDate: json['startDate'] as String? ?? '',
      endDate: json['endDate'] as String? ?? '',
    );

Map<String, dynamic> _$$FilterReportParamsImplToJson(
        _$FilterReportParamsImpl instance) =>
    <String, dynamic>{
      'carStatus': instance.carStatus,
      'paymentStatus': instance.paymentStatus,
      'customerName': instance.customerName,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

_$InventoryParamsImpl _$$InventoryParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$InventoryParamsImpl(
      inventId: json['invent_id'] as String? ?? '',
      cusId: json['cus_id'] as String? ?? '',
      cusEmail: json['cus_email'] as String? ?? '',
      cusName: json['cus_name'] as String? ?? '',
      cusCompany: json['cus_company'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      vehicleName: json['vehicle_name'] as String? ?? '',
      vinNumber: json['vin_number'] as String? ?? '',
      lotNumber: json['lot_number'] as String? ?? '',
      yearOfManufacture: json['year'] as String? ?? '',
      color: json['color'] as String? ?? '',
      isKey: json['is_key'] as bool? ?? false,
    );

Map<String, dynamic> _$$InventoryParamsImplToJson(
        _$InventoryParamsImpl instance) =>
    <String, dynamic>{
      'invent_id': instance.inventId,
      'cus_id': instance.cusId,
      'cus_email': instance.cusEmail,
      'cus_name': instance.cusName,
      'cus_company': instance.cusCompany,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'vehicle_name': instance.vehicleName,
      'vin_number': instance.vinNumber,
      'lot_number': instance.lotNumber,
      'year': instance.yearOfManufacture,
      'color': instance.color,
      'is_key': instance.isKey,
    };

_$VehicleParamsImpl _$$VehicleParamsImplFromJson(Map<String, dynamic> json) =>
    _$VehicleParamsImpl(
      vehicleName: json['vehicle_name'] as String? ?? '',
      vinNumber: json['vin_number'] as String? ?? '',
      lotNumber: json['lot_number'] as String? ?? '',
      yearOfManufacture: json['year'] as String? ?? '',
      color: json['color'] as String? ?? '',
      isKey: json['is_key'] as bool? ?? false,
    );

Map<String, dynamic> _$$VehicleParamsImplToJson(_$VehicleParamsImpl instance) =>
    <String, dynamic>{
      'vehicle_name': instance.vehicleName,
      'vin_number': instance.vinNumber,
      'lot_number': instance.lotNumber,
      'year': instance.yearOfManufacture,
      'color': instance.color,
      'is_key': instance.isKey,
    };

_$InvoiceParamsImpl _$$InvoiceParamsImplFromJson(Map<String, dynamic> json) =>
    _$InvoiceParamsImpl(
      invoiceNumber: json['invoice_no'] ?? 'N/A',
      invoiceDate: json['invoice_date'] == null
          ? null
          : DateTime.parse(json['invoice_date'] as String),
      invoiceAmountCad: json['invoice_amount_cad'] as String? ?? 'N/A',
      hstAmountCad: json['hst_amount_cad'] as String? ?? 'N/A',
      invoiceAmountAed: json['invoice_amount_aed'] as String? ?? 'N/A',
      totalAmountAed: json['total_amount_aed'] as String? ?? 'N/A',
    );

Map<String, dynamic> _$$InvoiceParamsImplToJson(_$InvoiceParamsImpl instance) =>
    <String, dynamic>{
      'invoice_no': instance.invoiceNumber,
      'invoice_date': instance.invoiceDate?.toIso8601String(),
      'invoice_amount_cad': instance.invoiceAmountCad,
      'hst_amount_cad': instance.hstAmountCad,
      'invoice_amount_aed': instance.invoiceAmountAed,
      'total_amount_aed': instance.totalAmountAed,
    };

_$TowingParamsImpl _$$TowingParamsImplFromJson(Map<String, dynamic> json) =>
    _$TowingParamsImpl(
      departurePort: json['departure_port'] as String? ?? '',
      towingCity: json['towing_city'] as String? ?? '',
      towingDate: json['towing_date'] == null
          ? null
          : DateTime.parse(json['towing_date'] as String),
      towingCostAed: json['towing_cost_aed'] as String? ?? '',
      towingCostCad: json['towing_cost_cad'] as String? ?? '',
    );

Map<String, dynamic> _$$TowingParamsImplToJson(_$TowingParamsImpl instance) =>
    <String, dynamic>{
      'departure_port': instance.departurePort,
      'towing_city': instance.towingCity,
      'towing_date': instance.towingDate?.toIso8601String(),
      'towing_cost_aed': instance.towingCostAed,
      'towing_cost_cad': instance.towingCostCad,
    };

_$ShippingParamsImpl _$$ShippingParamsImplFromJson(Map<String, dynamic> json) =>
    _$ShippingParamsImpl(
      containerNumber: json['container_no'] as String? ?? '',
      bookingNumber: json['booking_no'] as String? ?? '',
      shippingDate: json['shipping_date'] == null
          ? null
          : DateTime.parse(json['shipping_date'] as String),
      expArrivalDate: json['exp_arrival_date'] == null
          ? null
          : DateTime.parse(json['exp_arrival_date'] as String),
      shippingCostAed: json['shipping_cost_aed'] as String? ?? '',
      shippingCostCad: json['shipping_cost_cad'] as String? ?? '',
      offLoadingPort: json['off_loading_port'] as String? ?? '',
    );

Map<String, dynamic> _$$ShippingParamsImplToJson(
        _$ShippingParamsImpl instance) =>
    <String, dynamic>{
      'container_no': instance.containerNumber,
      'booking_no': instance.bookingNumber,
      'shipping_date': instance.shippingDate?.toIso8601String(),
      'exp_arrival_date': instance.expArrivalDate?.toIso8601String(),
      'shipping_cost_aed': instance.shippingCostAed,
      'shipping_cost_cad': instance.shippingCostCad,
      'off_loading_port': instance.offLoadingPort,
    };

_$PortParamsImpl _$$PortParamsImplFromJson(Map<String, dynamic> json) =>
    _$PortParamsImpl(
      arrivalDate: json['arrival_date'] == null
          ? null
          : DateTime.parse(json['arrival_date'] as String),
      clearanceDate: json['clearance_date'] == null
          ? null
          : DateTime.parse(json['clearance_date'] as String),
      clearanceAmount: json['clearance_amount'] as String? ?? '',
      vatAmountAed: json['vat_amount_aed'] as String? ?? '',
      portWarehouseCost: json['port_warehouse_cost'] as String? ?? '',
      customCostAed: json['custom_cost_aed'] as String? ?? '',
    );

Map<String, dynamic> _$$PortParamsImplToJson(_$PortParamsImpl instance) =>
    <String, dynamic>{
      'arrival_date': instance.arrivalDate?.toIso8601String(),
      'clearance_date': instance.clearanceDate?.toIso8601String(),
      'clearance_amount': instance.clearanceAmount,
      'vat_amount_aed': instance.vatAmountAed,
      'port_warehouse_cost': instance.portWarehouseCost,
      'custom_cost_aed': instance.customCostAed,
    };

_$WarehouseParamsImpl _$$WarehouseParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$WarehouseParamsImpl(
      name: json['warehouse_name'] as String? ?? '',
      arrivalDate: json['arrival_date'] == null
          ? null
          : DateTime.parse(json['arrival_date'] as String),
      storageCost: json['storage_cost'] as String? ?? '',
      pickingDate: json['picking_date'] == null
          ? null
          : DateTime.parse(json['picking_date'] as String),
      authorizedBy: json['authorized_by'] as String? ?? '',
      authorizedDate: json['authorized_date'] == null
          ? null
          : DateTime.parse(json['authorized_date'] as String),
      pickedBy: json['picked_by'] as String? ?? '',
      pickedDate: json['picked_date'] == null
          ? null
          : DateTime.parse(json['picked_date'] as String),
      emiratesId: json['emirates_id'] as String? ?? '',
    );

Map<String, dynamic> _$$WarehouseParamsImplToJson(
        _$WarehouseParamsImpl instance) =>
    <String, dynamic>{
      'warehouse_name': instance.name,
      'arrival_date': instance.arrivalDate?.toIso8601String(),
      'storage_cost': instance.storageCost,
      'picking_date': instance.pickingDate?.toIso8601String(),
      'authorized_by': instance.authorizedBy,
      'authorized_date': instance.authorizedDate?.toIso8601String(),
      'picked_by': instance.pickedBy,
      'picked_date': instance.pickedDate?.toIso8601String(),
      'emirates_id': instance.emiratesId,
    };

_$VccParamsImpl _$$VccParamsImplFromJson(Map<String, dynamic> json) =>
    _$VccParamsImpl(
      receivedDate: json['received_date'] == null
          ? null
          : DateTime.parse(json['received_date'] as String),
      url: json['url'] as String? ?? '',
      issuedBy: json['issued_by'] as String? ?? '',
      issuedDate: json['issued_date'] == null
          ? null
          : DateTime.parse(json['issued_date'] as String),
      pickedBy: json['picked_by'] as String? ?? '',
      pickedDate: json['picked_date'] == null
          ? null
          : DateTime.parse(json['picked_date'] as String),
      emiratesId: json['emirates_id'] as String? ?? '',
    );

Map<String, dynamic> _$$VccParamsImplToJson(_$VccParamsImpl instance) =>
    <String, dynamic>{
      'received_date': instance.receivedDate?.toIso8601String(),
      'url': instance.url,
      'issued_by': instance.issuedBy,
      'issued_date': instance.issuedDate?.toIso8601String(),
      'picked_by': instance.pickedBy,
      'picked_date': instance.pickedDate?.toIso8601String(),
      'emirates_id': instance.emiratesId,
    };
