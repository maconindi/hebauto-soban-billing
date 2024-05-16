import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/inventory_stats_entity.dart';

abstract class CustomerDashboardRepository {
  Future <Either<Failure, InventoryStatsEntity>> fetchInventoryStats();
}