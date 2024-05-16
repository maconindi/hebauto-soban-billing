import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/inventory_entity.dart';
import '../usecases/inventory_usecase.dart';

abstract class InventoryRepository {
  Future <Either<Failure, InventoryEntity>> addInventory(InventoryParams inventoryParams);
  Future <Either<Failure, InventoryEntity>> fetchInventory({required int page});
  Future <Either<Failure, InventoryEntity>> updateInventory(String uid, Object inventoryParams);
  Future <Either<Failure, InventoryEntity>> searchInventory({int page = 1,required String category,required String args});
  Future <Either<Failure, InventoryEntity>> deleteInventory(String id);



}