
import 'package:dartz/dartz.dart';
import 'package:hebauto/core/models/paginated_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/api/dio_client.dart';
import '../../../../core/network/api/list_api.dart';
import '../../../customer_profile/domain/entity/customer_entity.dart';
import '../../../customer_profile/domain/usecase/customer_profile_usecase.dart';
import '../../domain/entities/add_customer_entity.dart';
import '../models/add_customer_model.dart';
import '../models/customer_model.dart';


abstract class DashboardRemoteDataSource {
  Future <Either<Failure, AddCustomerEntity>> addCustomer(CustomerParams customerParams);
  Future <Either<Failure, List<CustomerEntity>>> showCustomers();
}


@injectable
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {

  DashboardRemoteDataSourceImpl(this._client);

  final DioClient _client;

  @override
  Future<Either<Failure, AddCustomerEntity>> addCustomer(CustomerParams customerParams) async {

      final response = await _client.postRequest(
        ListAPI.createCustomer,
        data: customerParams.toJson(),
        converter: (response) {
          return  AddCustomerModel.fromJson(response);
        },
      );
      return response;
  }

  @override
  Future<Either<Failure, List<CustomerEntity>>> showCustomers() async {


    final response = await _client.getRequest(
      ListAPI.fetchCustomers,
      isIsolate: false,
      converter: (response) {
        final res = PaginatedModel.fromJson(response,entityName: 'data').data;
        return res.dataList.map((e) {
          return CustomerModel.fromJson(e);
        }).toList();
      },
    );
    return response;
  }

}
