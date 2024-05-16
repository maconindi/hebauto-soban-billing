import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/core/usecase/usecase.dart';
import 'package:hebauto/features_customer/tracking/domain/repository/tracking_repository.dart';
import 'package:injectable/injectable.dart';

import '../entity/track_item_entity.dart';

part 'track_inventory_usecase.freezed.dart';
part 'track_inventory_usecase.g.dart';



@injectable
class TrackInventoryUsecase extends UseCase<TrackItemEntity, TrackingParams> {

  final TrackingInventoryRepository repository;
  TrackInventoryUsecase(this.repository);

  @override
  Future<Either<Failure, TrackItemEntity>> call(TrackingParams params) => repository.trackInventory(params);
}



@freezed
class TrackingParams with _$TrackingParams {
  const factory TrackingParams({

    @JsonKey(name: 'vin_number') @Default('') String vinNumber,
    @JsonKey(name: 'lot_number') @Default('') String lotNumber,

  }) = _TrackingParams;

  factory TrackingParams.fromJson(Map<String, dynamic> json) =>
      _$TrackingParamsFromJson(json);
}

