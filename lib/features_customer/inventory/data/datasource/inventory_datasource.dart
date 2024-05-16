import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/paginated_model.dart';
import '../../../../core/network/api/dio_client.dart';
import '../../../../core/network/api/list_api.dart';
import '../../../../core/services/hive/main_box.dart';
import '../../domain/entity/inventory_entity_customer.dart';
import '../model/inventory_model.dart';

abstract class CustomerInventoryRemoteDataSource {
  Future<Either<Failure, InventoryEntityCustomer>> fetchInventory(
      {int page = 1});

  Future<Either<Failure, InventoryEntityCustomer>> searchInventory(
      {int page = 1, required String category, required String args});
}

@injectable
class CustomerInventoryRemoteDataSourceImpl
    implements CustomerInventoryRemoteDataSource {
  CustomerInventoryRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<Either<Failure, InventoryEntityCustomer>> fetchInventory(
      {int page = 1}) async {
    final response = await _client.postRequest(ListAPI.fetchCustomerInventory,
        query: {'page': page}, converter: (response) {
      final res = PaginatedModel.fromJson(response, entityName: 'item').data;

      final items = res.dataList.map((e) => ItemModel.fromJson(e)).toList();

      return InventoryModel(
          item: items,
          status: true,
          message: 'Operation Successful',
          prePageUrl: res.prevPageUrl,
          nextPageUrl: res.nextPageUrl,
          firstPageUrl: res.firstPageUrl,
          lastPageUrl: res.lastPageUrl,
          lastPage: res.lastPage,
          currentPage: res.currentPage);
    }, data: {
      'cus_email': '${(MainBoxMixin.mainBox?.get(MainBoxKeys.email.name))}'
    });
    return response;
  }

  @override
  Future<Either<Failure, InventoryEntityCustomer>> searchInventory(
      {int page = 1, required String category, required String args}) async {
    final response = await _client.postRequest(
        ListAPI.fetchCustomerInventory,



        query: {'page': page, category : args}, converter: (response) {
      final res = PaginatedModel.fromJson(response,entityName: 'item').data;

      final items = res.dataList.map((e) => ItemModel.fromJson(e)).toList();


      return InventoryModel(
          item: items,
          status: true,
          message: 'Operation Successful',
          prePageUrl: res.prevPageUrl,
          nextPageUrl: res.nextPageUrl,
          firstPageUrl: res.firstPageUrl,
          lastPageUrl: res.lastPageUrl,
          lastPage: res.lastPage,
          currentPage: res.currentPage);
    },
        data: {
      'cus_email': '${(MainBoxMixin.mainBox?.get(MainBoxKeys.email.name))}',

    });
    return response;
  }
}
