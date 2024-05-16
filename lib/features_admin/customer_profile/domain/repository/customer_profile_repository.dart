
import 'package:dartz/dartz.dart';
import 'package:hebauto/features_admin/customer_profile/domain/entity/customer_entity.dart';

import '../../../../core/error/failure.dart';
import '../usecase/customer_profile_usecase.dart';

abstract class CustomerProfileRepository {
  Future <Either<Failure, CustomerResponseEntity>> addCustomer(CustomerParams customerParams);
  Future <Either<Failure, CustomerResponseEntity>> showCustomers({required int page});
  Future <Either<Failure, CustomerResponseEntity>> updateCustomer(String uid, CustomerParams customerParams);
  Future <Either<Failure, CustomerResponseEntity>> deleteCustomer(String uid);
}