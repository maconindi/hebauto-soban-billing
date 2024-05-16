import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/track_item_entity.dart';
import '../usecase/track_inventory_usecase.dart';

abstract class TrackingInventoryRepository {
  Future <Either<Failure, TrackItemEntity>> trackInventory(AdminTrackingParams params);

}