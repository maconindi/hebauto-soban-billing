import 'package:dartz/dartz.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/customer_pricelist_entity.dart';
import '../../domain/repository/customer_pricelist_repository.dart';
import '../../domain/usecase/customer_pricelist_usecase.dart';
import '../datasource/customer_pricelist_datasource.dart';


@Injectable(as: CustomerPriceListRepository)
class CustomerPriceListRepositoryImpl extends CustomerPriceListRepository {
  CustomerPriceListRepositoryImpl(this.priceListDataSource);
  final CustomerPriceListDataSource priceListDataSource;

  @override
  Future<Either<Failure, CustomerPriceListResponseEntity>> fetchPriceList({required CustomerPriceListParams params}) async {
    final response = await priceListDataSource.fetchUserPriceList(params: params);
    return response.fold(
      Left.new,
      Right.new,
    );
  }



}