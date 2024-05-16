import 'package:dartz/dartz.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/core/usecase/usecase.dart';
import 'package:hebauto/features_customer/dashboard/domain/entity/inventory_stats_entity.dart';
import 'package:hebauto/features_customer/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';


@injectable
class DashboardStatsUseCase extends UseCase <InventoryStatsEntity, NoParams> {

  DashboardStatsUseCase( this.customerDashboardRepository);

  final CustomerDashboardRepository customerDashboardRepository;
  @override
  Future<Either<Failure, InventoryStatsEntity>> call(NoParams params) => customerDashboardRepository.fetchInventoryStats();
}