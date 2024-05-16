import 'package:dartz/dartz.dart';
import 'package:hebauto/features_admin/inventory/domain/entity/inventory_entity.dart';
import 'package:hebauto/features_admin/inventory/domain/usecases/inventory_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repository/inventory_repository.dart';
import '../datasource/inventory_datasource.dart';

@Injectable(as: InventoryRepository)
class InventoryRepositoryImpl extends InventoryRepository{
  InventoryRepositoryImpl(this.dashboardRemoteDataSourceImpl);

  final InventoryRemoteDataSourceImpl dashboardRemoteDataSourceImpl;

  @override
  Future<Either<Failure, InventoryEntity>> addInventory(InventoryParams inventoryParams) async {
    final response = await dashboardRemoteDataSourceImpl.addInventory(inventoryParams);
    return response.fold(
      Left.new,
      Right.new,
    );
  }

  @override
  Future<Either<Failure, InventoryEntity>> fetchInventory({required int page}) async {

    final response = await dashboardRemoteDataSourceImpl.fetchInventory(page: page);
    return response.fold(
          Left.new,
          Right.new,
    );
  }

  @override
  Future<Either<Failure, InventoryEntity>> updateInventory(String uid, Object inventoryParams) async{
      final response = await dashboardRemoteDataSourceImpl.updateInventory(uid, inventoryParams);
      return response.fold(
        Left.new,
        Right.new,
      );
  }

  @override
  Future<Either<Failure, InventoryEntity>> searchInventory({int page = 1, required String category, required String args}) async {
    final response = await dashboardRemoteDataSourceImpl.searchInventory(page: page, category: category, args: args);
    return response.fold(
      Left.new,
      Right.new,
    );
  }

  @override
  Future<Either<Failure, InventoryEntity>> deleteInventory(String id) async {
    final response = await dashboardRemoteDataSourceImpl.deleteInventory(id);
    return response.fold(
      Left.new,
      Right.new,
    );
  }

  // @override
  // Future<Either<Failure, List<InventoryItemEntity>>> updateInventory(String uid, InventoryParams inventoryParams) async {
  //   final response = await dashboardRemoteDataSourceImpl.updateInventory(uid, inventoryParams);
  //   return response.fold(
  //         (failure) => Left(failure),
  //         (loginResponse) {
  //       return Right(loginResponse);
  //     },
  //   );
  // }



}