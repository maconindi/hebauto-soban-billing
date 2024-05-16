import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/inventory_entity_customer.dart';

abstract class CustomerInventoryRepository {
  Future <Either<Failure, InventoryEntityCustomer>> fetchInventory({int page = 1});
  Future <Either<Failure, InventoryEntityCustomer>> searchInventory({int page = 1,required String category,required String args});

}