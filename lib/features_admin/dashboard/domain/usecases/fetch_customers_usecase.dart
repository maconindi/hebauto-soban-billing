import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../customer_profile/domain/entity/customer_entity.dart';
import '../repository/dashboard_repository.dart';

@injectable
class FetchCustomersUseCase extends UseCase<List<CustomerEntity>, NoParams> {

  FetchCustomersUseCase(this.repository);
  final DashboardRepository repository;

  @override
  Future<Either<Failure, List<CustomerEntity>>> call(NoParams params) => repository.showCustomers();

}


