import 'package:dartz/dartz.dart';
import 'package:hebauto/core/error/failure.dart';

import 'package:injectable/injectable.dart';

import '../../domain/entity/customer_entity.dart';
import '../../domain/repository/customer_profile_repository.dart';
import '../../domain/usecase/customer_profile_usecase.dart';
import '../datasource/customer_profile_datasource.dart';


@Injectable(as: CustomerProfileRepository)
class CustomerProfileRepositoryImpl extends CustomerProfileRepository{
  CustomerProfileRepositoryImpl(this.dataSource);

  final CustomerProfileDataSource dataSource;
  @override
  Future<Either<Failure, CustomerResponseEntity>> addCustomer(CustomerParams params) async {
    final response = await dataSource.addCustomer(params);
    return response.fold(
      Left.new,
      Right.new,
    );
  }

  @override
  Future<Either<Failure, CustomerResponseEntity>> showCustomers({required int page}) async {
    final response = await dataSource.showCustomers(page: page);
    return response.fold(
      Left.new,
      Right.new,
    );
  }

  @override
  Future<Either<Failure, CustomerResponseEntity>> updateCustomer(String uid, CustomerParams customerParams) async {
    final response = await dataSource.updateCustomer(uid, customerParams );
    return response.fold(
      Left.new,
      Right.new,
    );
  }

  @override
  Future<Either<Failure, CustomerResponseEntity>> deleteCustomer(String uid) async {
    final response = await dataSource.deleteCustomer(uid);
    return response.fold(
      Left.new,
      Right.new,
    );
  }
}