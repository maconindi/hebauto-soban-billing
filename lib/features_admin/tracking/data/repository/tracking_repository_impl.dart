import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/track_item_entity.dart';
import '../../domain/repository/tracking_repository.dart';
import '../../domain/usecase/track_inventory_usecase.dart';
import '../datasource/tracking_datesource.dart';

@Injectable(as: TrackingInventoryRepository)
class TrackingInventoryRepositoryImpl extends TrackingInventoryRepository {
  final TrackInventoryRemoteDataSourceImpl trackInventoryRemoteDataSourceImpl;

  TrackingInventoryRepositoryImpl(this.trackInventoryRemoteDataSourceImpl);

  @override
  Future<Either<Failure, TrackItemEntity>> trackInventory(AdminTrackingParams params) async {
    final response = await trackInventoryRemoteDataSourceImpl.trackInventory(params);
    return response.fold(
      (failure) => Left(failure),
      (loginResponse) => Right(loginResponse),
    );
  }
}
