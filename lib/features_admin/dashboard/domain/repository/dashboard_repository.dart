

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../customer_profile/domain/entity/customer_entity.dart';
import '../../../customer_profile/domain/usecase/customer_profile_usecase.dart';
import '../entities/add_customer_entity.dart';

abstract class DashboardRepository {
  Future <Either<Failure, AddCustomerEntity>> addCustomer(CustomerParams customerParams);
  Future <Either<Failure, List<CustomerEntity>>> showCustomers();

}