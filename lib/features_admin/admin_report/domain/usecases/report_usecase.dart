import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hebauto/features_admin/admin_report/domain/entities/report_entitiy.dart';
import 'package:hebauto/features_admin/admin_report/domain/repository/report_repository.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';

part 'report_usecase.freezed.dart';
part 'report_usecase.g.dart';

@lazySingleton
class ReportUseCase extends UseCase<ReportEntity, ReportParams> {
  final ReportRepository repository;

  ReportUseCase(this.repository);

  @override
  Future<Either<Failure, ReportEntity>> call(ReportParams params) =>
      repository.fetchReport(page: 1);
}

@freezed
class ReportParams with _$ReportParams {
  const factory ReportParams({
    @JsonKey(name: 'invent_id') @Default('') String inventId,
    @JsonKey(name: 'cus_id') @Default('') String cusId,
    @JsonKey(name: 'cus_email') @Default('') String cusEmail,
    @JsonKey(name: 'cus_name') @Default('') String cusName,
    @JsonKey(name: 'cus_company') @Default('') String cusCompany,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
    @JsonKey(name: 'created_at') @Default('') String createdAt,

    // Additional fields
    @JsonKey(name: 'vehicle_name') @Default('') String vehicleName,
    @JsonKey(name: 'vin_number') @Default('') String vinNumber,
    @JsonKey(name: 'lot_number') @Default('') String lotNumber,
    @JsonKey(name: 'year') @Default('') String yearOfManufacture,
    @JsonKey(name: 'color') @Default('') String color,
    @JsonKey(name: 'is_key') @Default(false) bool isKey,
  }) = _InventoryParams;

  factory ReportParams.fromJson(Map<String, dynamic> json) =>
      _$ReportParamsFromJson(json);
}

@freezed
class VehicleParams with _$VehicleParams {
  const factory VehicleParams({
    @JsonKey(name: 'vehicle_name') @Default('') String vehicleName,
    @JsonKey(name: 'vin_number') @Default('') String vinNumber,
    @JsonKey(name: 'lot_number') @Default('') String lotNumber,
    @JsonKey(name: 'year') @Default('') String yearOfManufacture,
    @JsonKey(name: 'color') @Default('') String color,
    @JsonKey(name: 'is_key') @Default(false) bool isKey,
  }) = _VehicleParams;
  factory VehicleParams.fromJson(Map<String, dynamic> json) =>
      _$VehicleParamsFromJson(json);
}

@freezed
class InvoiceParams with _$InvoiceParams {
  const factory InvoiceParams({
    @JsonKey(name: 'invoice_no') @Default('N/A') invoiceNumber,
    @JsonKey(name: 'invoice_date') DateTime? invoiceDate,
    @JsonKey(name: 'invoice_amount_cad')
    @Default('N/A')
    String invoiceAmountCad,
    @JsonKey(name: 'hst_amount_cad') @Default('N/A') String hstAmountCad,
    @JsonKey(name: 'invoice_amount_aed')
    @Default('N/A')
    String invoiceAmountAed,
    @JsonKey(name: 'total_amount_aed') @Default('N/A') String totalAmountAed,
  }) = _InvoiceParams;

  factory InvoiceParams.fromJson(Map<String, dynamic> json) =>
      _$InvoiceParamsFromJson(json);
}

@freezed
abstract class TowingParams with _$TowingParams {
  const factory TowingParams({
    @JsonKey(name: 'departure_port') @Default('') String departurePort,
    @JsonKey(name: 'towing_city') @Default('') String towingCity,
    @JsonKey(name: 'towing_date') DateTime? towingDate,
    @JsonKey(name: 'towing_cost_aed') @Default('') String towingCostAed,
    @JsonKey(name: 'towing_cost_cad') @Default('') String towingCostCad,
  }) = _TowingParams;

  factory TowingParams.fromJson(Map<String, dynamic> json) =>
      _$TowingParamsFromJson(json);
}

@freezed
class ShippingParams with _$ShippingParams {
  const factory ShippingParams({
    @JsonKey(name: 'container_no') @Default('') String containerNumber,
    @JsonKey(name: 'booking_no') @Default('') String bookingNumber,
    @JsonKey(name: 'shipping_date') DateTime? shippingDate,
    @JsonKey(name: 'exp_arrival_date') DateTime? expArrivalDate,
    @JsonKey(name: 'shipping_cost_aed') @Default('') String shippingCostAed,
    @JsonKey(name: 'shipping_cost_cad') @Default('') String shippingCostCad,
    @JsonKey(name: 'off_loading_port') @Default('') String offLoadingPort,
  }) = _ShippingParams;

  factory ShippingParams.fromJson(Map<String, dynamic> json) =>
      _$ShippingParamsFromJson(json);
}

@freezed
class PortParams with _$PortParams {
  const factory PortParams({
    @JsonKey(name: 'arrival_date') DateTime? arrivalDate,
    @JsonKey(name: 'clearance_date') DateTime? clearanceDate,
    @JsonKey(name: 'clearance_amount') @Default('') String clearanceAmount,
    @JsonKey(name: 'vat_amount_aed') @Default('') String vatAmountAed,
    @JsonKey(name: 'port_warehouse_cost') @Default('') String portWarehouseCost,
    @JsonKey(name: 'custom_cost_aed') @Default('') String customCostAed,
  }) = _PortParams;

  factory PortParams.fromJson(Map<String, dynamic> json) =>
      _$PortParamsFromJson(json);
}

@freezed
class WarehouseParams with _$WarehouseParams {
  const factory WarehouseParams({
    @JsonKey(name: 'warehouse_name') @Default('') String name,
    @JsonKey(name: 'arrival_date') DateTime? arrivalDate,
    @JsonKey(name: 'storage_cost') @Default('') String storageCost,
    @JsonKey(name: 'picking_date') DateTime? pickingDate,
    @JsonKey(name: 'authorized_by') @Default('') String authorizedBy,
    @JsonKey(name: 'authorized_date') DateTime? authorizedDate,
    @JsonKey(name: 'picked_by') @Default('') String pickedBy,
    @JsonKey(name: 'picked_date') DateTime? pickedDate,
    @JsonKey(name: 'emirates_id') @Default('') String emiratesId,
  }) = _WarehouseParams;

  factory WarehouseParams.fromJson(Map<String, dynamic> json) =>
      _$WarehouseParamsFromJson(json);
}

@freezed
class VccParams with _$VccParams {
  const factory VccParams({
    @JsonKey(name: 'received_date') DateTime? receivedDate,
    @JsonKey(name: 'url') @Default('') String url,
    @JsonKey(name: 'issued_by') @Default('') String issuedBy,
    @JsonKey(name: 'issued_date') DateTime? issuedDate,
    @JsonKey(name: 'picked_by') @Default('') String pickedBy,
    @JsonKey(name: 'picked_date') DateTime? pickedDate,
    @JsonKey(name: 'emirates_id') @Default('') String emiratesId,
  }) = _VccParams;

  factory VccParams.fromJson(Map<String, dynamic> json) =>
      _$VccParamsFromJson(json);
}
