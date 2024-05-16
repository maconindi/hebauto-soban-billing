import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../entity/track_item_entity.dart';
import '../repository/tracking_repository.dart';

part 'track_inventory_usecase.freezed.dart';
part 'track_inventory_usecase.g.dart';



@injectable
class TrackInventoryUsecase extends UseCase<TrackItemEntity, AdminTrackingParams> {
  TrackInventoryUsecase(this.repository);

  final TrackingInventoryRepository repository;

  @override
  Future<Either<Failure, TrackItemEntity>> call(AdminTrackingParams params) => repository.trackInventory(params);
}



@freezed
class AdminTrackingParams with _$AdminTrackingParams {
  const factory AdminTrackingParams({

    @JsonKey(name: 'vin_number') @Default('') String vinNumber,
    @JsonKey(name: 'lot_number') @Default('') String lotNumber,

  }) = _AdminTrackingParams;

  factory AdminTrackingParams.fromJson(Map<String, dynamic> json) =>
      _$AdminTrackingParamsFromJson(json);
}

