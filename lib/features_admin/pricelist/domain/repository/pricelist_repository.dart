import 'package:dartz/dartz.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/features_admin/pricelist/domain/usecase/pricelist_usecase.dart';

import '../entity/pricelist_entity.dart';

abstract class PriceListRepository {
  Future<Either<Failure, PriceListResponseEntity>> fetchPriceList({required PriceListParams params});
  Future<Either<Failure, PriceListResponseEntity>> addPriceList({required PriceListParams params});
  Future<Either<Failure, PriceListResponseEntity>> deletePriceList({required PriceListParams params});
}