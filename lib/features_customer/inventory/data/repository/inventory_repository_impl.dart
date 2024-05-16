import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/inventory_entity_customer.dart';
import '../../domain/repository/inventory_repository.dart';
import '../datasource/inventory_datasource.dart';

@Injectable(as: CustomerInventoryRepository)
class CustomerInventoryRepositoryImpl extends CustomerInventoryRepository{

  final CustomerInventoryRemoteDataSourceImpl dashboardRemoteDataSourceImpl;
  CustomerInventoryRepositoryImpl(this.dashboardRemoteDataSourceImpl);

  @override
  Future<Either<Failure, InventoryEntityCustomer>> fetchInventory({int page = 1}) async {
      final response = await dashboardRemoteDataSourceImpl.fetchInventory(page: page);
      return response.fold(
            (failure) => Left(failure),
            (loginResponse) {
          return Right(loginResponse);
        },
      );
  }

  @override
  Future<Either<Failure, InventoryEntityCustomer>> searchInventory({int page = 1, required String category, required String args}) async {
    final response = await dashboardRemoteDataSourceImpl.searchInventory(page: page, category: category, args: args);
    return response.fold(
          (failure) => Left(failure),
          (loginResponse) {
        return Right(loginResponse);
      },
    );
  }




}