import 'package:dartz/dartz.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/features_admin/pricelist/domain/repository/pricelist_repository.dart';
import 'package:hebauto/features_admin/pricelist/domain/usecase/pricelist_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/pricelist_entity.dart';
import '../datasource/pricelist_datasource.dart';


@Injectable(as: PriceListRepository)
class PriceListRepositoryImpl extends PriceListRepository {
  PriceListRepositoryImpl(this.priceListDataSource);
  final PriceListDataSource priceListDataSource;

  @override
  Future<Either<Failure, PriceListResponseEntity>> fetchPriceList({required PriceListParams params}) async {
    final response = await priceListDataSource.fetchUserPriceList(params: params);
    return response.fold(
      Left.new,
      Right.new,
    );
  }

  @override
  Future<Either<Failure, PriceListResponseEntity>> addPriceList({required PriceListParams params}) async {
    final response = await priceListDataSource.addPriceList(params: params);
    return response.fold(
          Left.new,
          Right.new,
    );
  }

  @override
  Future<Either<Failure, PriceListResponseEntity>> deletePriceList({required PriceListParams params}) async {
    final response = await priceListDataSource.deletePriceList(params: params);
    return response.fold(
      Left.new,
      Right.new,
    );
  }


}