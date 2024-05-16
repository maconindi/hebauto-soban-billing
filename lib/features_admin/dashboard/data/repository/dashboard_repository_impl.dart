
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../customer_profile/domain/entity/customer_entity.dart';
import '../../../customer_profile/domain/usecase/customer_profile_usecase.dart';
import '../../domain/entities/add_customer_entity.dart';
import '../../domain/repository/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';



@Injectable(as: DashboardRepository)
class DashboardRepositoryImpl extends DashboardRepository{
  DashboardRepositoryImpl(this.dashboardRemoteDataSourceImpl);

  final DashboardRemoteDataSourceImpl dashboardRemoteDataSourceImpl;

  @override
  Future<Either<Failure, AddCustomerEntity>> addCustomer(CustomerParams customerParams) async {
    final response = await dashboardRemoteDataSourceImpl.addCustomer(customerParams);
    return response.fold(
          Left.new,
          Right.new,
    );
  }

  @override
  Future<Either<Failure, List<CustomerEntity>>> showCustomers() async {

    final response = await dashboardRemoteDataSourceImpl.showCustomers();
    return response.fold(
      Left.new,
      Right.new,
    );
  }

}