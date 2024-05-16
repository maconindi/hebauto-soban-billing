import 'package:dartz/dartz.dart';
import 'package:hebauto/core/models/response_model.dart';

import '../../../../core/error/failure.dart';
import '../entity/purchase_entity.dart';
import '../usecase/purchases_usecase.dart';

abstract class PurchaseRepository{

  Future<Either<Failure, ResponseModel>> addPurchaseItem(AddPurchasesParams params);
  Future<Either<Failure, PurchaseResponseEntity>> fetchPurchaseItems();
}