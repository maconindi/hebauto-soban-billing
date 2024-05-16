
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/paginated_model.dart';
import '../../../../core/network/api/dio_client.dart';
import '../../../../core/network/api/list_api.dart';
import '../../domain/entity/inventory_entity.dart';
import '../../domain/usecases/inventory_usecase.dart';
import '../model/inventory_model.dart';



abstract class InventoryRemoteDataSource{
  Future <Either<Failure, InventoryEntity>> addInventory(InventoryParams inventoryParams);
  Future <Either<Failure, InventoryEntity>> updateInventory(String uid, Object inventoryParams );
  Future <Either<Failure, InventoryEntity>> fetchInventory( {required int page});
  Future <Either<Failure, InventoryEntity>> searchInventory( {int page = 1,required String category,required String args});
  Future <Either<Failure, InventoryEntity>> deleteInventory(String id);

}


@injectable
class InventoryRemoteDataSourceImpl implements InventoryRemoteDataSource {

  InventoryRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<Either<Failure, InventoryEntity>> addInventory(InventoryParams inventoryParams) async {
    final response = await _client.postRequest(
      ListAPI.createInventory,
      data: inventoryParams.toJson(),
      converter: (response) {
        return  InventoryModel.fromJson(response);
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, InventoryEntity>> fetchInventory({required int page}) async {
    final response = await _client.getRequest(
      ListAPI.fetchInventory,
      queryParameters: {'page': page},
      isIsolate: false,
      converter: (response) {
        final res = PaginatedModel.fromJson(response, entityName: 'item').data;
        final items = res.dataList.map((e) => InventoryItemModel.fromJson(e)).toList();

        return InventoryModel(
            item: items,
            status: true,
            message: 'Operation Successful',
            prePageUrl: res.prevPageUrl,
            nextPageUrl: res.nextPageUrl,
            firstPageUrl: res.firstPageUrl,
            lastPageUrl: res.lastPageUrl,
            lastPage: res.lastPage,
            currentPage: res.currentPage
        );
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, InventoryEntity>> updateInventory(String uid, Object params) async {

    final response = await _client.putRequest(
      ListAPI.updateInventory,
      uid,
      data: toJson(params),
      converter: (response) {
        return InventoryModel.fromJson(response);
      },
    );
    return response;
  }

  Map<String, dynamic> toJson(Object object) {
    if (object is VehicleParams) {
      return object.toJson();
    }else if(object is InvoiceParams){
      return object.toJson();
    }else if(object is WarehouseParams){
      return object.toJson();
    }else if(object is PortParams){
      return object.toJson();
    }else if(object is ShippingParams){
      return object.toJson();
    }else if(object is TowingParams){
      return object.toJson();
    }else if(object is VccParams){
      return object.toJson();
    }
    throw ArgumentError('Object type not supported');
  }

  @override
  Future<Either<Failure, InventoryEntity>> searchInventory({int page = 1, required String category, required String args}) async {
    final response = await _client.getRequest(
      ListAPI.fetchInventory,
      //query: {'page': page, category : args},
      queryParameters: {'page': page, category : args},
      isIsolate: false,
      converter: (response) {
        final res = PaginatedModel.fromJson(response,entityName: 'item').data;
        final items = res.dataList.map((e) => InventoryItemModel.fromJson(e)).toList();

        return InventoryModel(
            item: items,
            status: true,
            message: 'Operation Successful',
            prePageUrl: res.prevPageUrl,
            nextPageUrl: res.nextPageUrl,
            firstPageUrl: res.firstPageUrl,
            lastPageUrl: res.lastPageUrl,
            lastPage: res.lastPage,
            currentPage: res.currentPage
        );
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, InventoryEntity>> deleteInventory(String id) async {
    final response = await _client.deleteRequest(
      ListAPI.deleteInventory,
      id,
      converter: (response) {
        return InventoryModel.fromJson(response);
      },
    );
    return response;

  }



}
