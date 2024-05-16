import 'package:dartz/dartz.dart';
import 'package:hebauto/features_admin/customer_profile/data/model/customer_profile_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/paginated_model.dart';
import '../../../../core/network/api/dio_client.dart';
import '../../../../core/network/api/list_api.dart';
import '../../domain/entity/customer_entity.dart';
import '../../domain/usecase/customer_profile_usecase.dart';

abstract class CustomerProfileDataSource {
  Future<Either<Failure, CustomerResponseEntity>> addCustomer(
      CustomerParams customerParams);

  Future<Either<Failure, CustomerResponseEntity>> showCustomers({required int page});

  Future<Either<Failure, CustomerResponseEntity>> updateCustomer(String uid,
      CustomerParams customerParams);

  Future<Either<Failure, CustomerResponseEntity>> deleteCustomer(String uid);
}

@Injectable(as: CustomerProfileDataSource)
class CustomerProfileDataSourceImpl extends CustomerProfileDataSource {
  CustomerProfileDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<Either<Failure, CustomerResponseEntity>> addCustomer(
      CustomerParams customerParams) async {
    final response = await _client.postRequest(
      ListAPI.createCustomer,
      data: customerParams.toJson(),
      converter: (response) {
        return CustomerProfileResponseModel.fromJson(response);
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, CustomerResponseEntity>> showCustomers({required int page}) async {
    final response = await _client.getRequest(
      ListAPI.fetchCustomers,
      isIsolate: false,
      converter: (response) {

        final res = PaginatedModel.fromJson(response, entityName: 'data').data;
        final items = res.dataList.map((e) => CustomerModel.fromJson(e)).toList();
        return CustomerProfileResponseModel(
          item: items,
          status: true,
          message: 'Operation Successful',
          prePageUrl: res.prevPageUrl,
          nextPageUrl: res.nextPageUrl,
          firstPageUrl: res.firstPageUrl,
          lastPageUrl: res.lastPageUrl,
          currentPage: res.currentPage,
          lastPage: res.lastPage,
        );
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, CustomerResponseEntity>> updateCustomer(String uid,
      CustomerParams customerParams) async {
    final response = await _client.putRequest(
      ListAPI.updateCustomer,
      uid,
      data: customerParams.toJson(),
      converter: (response) {
        return CustomerProfileResponseModel.fromJson(response);
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, CustomerResponseEntity>> deleteCustomer(String uid)  async{

    final response = await _client.deleteRequest(
      ListAPI.deleteCustomer,
      uid,
      converter: (response) {
        return CustomerProfileResponseModel.fromJson(response);
      },
    );
    return response;

  }
}
