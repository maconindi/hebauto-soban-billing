import 'package:dartz/dartz.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/features_customer/dashboard/domain/entity/inventory_stats_entity.dart';
import 'package:hebauto/features_customer/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

import '../datasource/dashboard_datasource.dart';

@Injectable(as: CustomerDashboardRepository)
class CustomerDashboardRepositoryImpl extends CustomerDashboardRepository {
  CustomerDashboardRepositoryImpl(this.customerDashboardDatasourceImpl);

  final CustomerDashboardDatasourceImpl customerDashboardDatasourceImpl;

  @override
  Future<Either<Failure, InventoryStatsEntity>> fetchInventoryStats() async {
    final response =
        await customerDashboardDatasourceImpl.fetchInventoryStats();
    return response.fold(
      Left.new,
      Right.new,
    );
  }
}
