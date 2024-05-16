import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/inventory_entity_customer.dart';
import '../repository/inventory_repository.dart';

part 'inventory_usecase.freezed.dart';

part 'inventory_usecase.g.dart';

@injectable
class CustomerInventoryUseCase extends UseCase<InventoryEntityCustomer, InventoryParams> {
  final CustomerInventoryRepository repository;

  CustomerInventoryUseCase(this.repository);

  @override
  Future<Either<Failure, InventoryEntityCustomer>> call(InventoryParams params) =>
      repository.fetchInventory();
}






@freezed
class InventoryParams with _$InventoryParams {
  const factory InventoryParams({
    @JsonKey(name: 'invent_id') @Default('') String inventId,
    @JsonKey(name: 'invoice_no') @Default('') String invoiceNo,
    @JsonKey(name: 'cus_id') @Default(0) int cusId,
    @JsonKey(name: 'cus_email') @Default('') String cusEmail,
    @JsonKey(name: 'invoice_url') @Default('') String invoiceUrl,
    @JsonKey(name: 'auction_name') @Default('') String auctionName,
    @JsonKey(name: 'booking_no') @Default('') String bookingNo,
    @JsonKey(name: 'towing_location') @Default('') String towingLocation,
    @JsonKey(name: 'departure_port') @Default('') String departurePort,
    @JsonKey(name: 'offloading_port') @Default('') String offloadingPort,
    @JsonKey(name: 'ship_container_no') @Default('') String shipContainerNo,
    @JsonKey(name: 'delivery_status') @Default('') String deliveryStatus,
    @JsonKey(name: 'expt_shipping_date') @Default('') String exptShippingDate,
    @JsonKey(name: 'expt_arrival_date') @Default('') String exptArrivalDate,
    @JsonKey(name: 'act_arrival_date') @Default('') String actArrivalDate,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
    @JsonKey(name: 'created_at') @Default('') String createdAt,

    // Additional fields
    @JsonKey(name: 'vehicle_name') @Default('') String vehicleName,
    @JsonKey(name: 'vin_number') @Default('') String vinNumber,
    @JsonKey(name: 'lot_number') @Default('') String lotNumber,
    @JsonKey(name: 'color') @Default('') String color,
    @JsonKey(name: 'is_key') @Default(false) bool isKey,
  }) = _InventoryParams;

  factory InventoryParams.fromJson(Map<String, dynamic> json) =>
      _$InventoryParamsFromJson(json);
}
