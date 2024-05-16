import 'package:dartz/dartz.dart';
import 'package:hebauto/core/error/failure.dart';

import '../entity/customer_pricelist_entity.dart';
import '../usecase/customer_pricelist_usecase.dart';

abstract class CustomerPriceListRepository {
  Future<Either<Failure, CustomerPriceListResponseEntity>> fetchPriceList({required CustomerPriceListParams params});
}