import 'package:dartz/dartz.dart';
import 'package:hebauto/core/error/failure.dart';

import '../../../../core/models/response_model.dart';
import '../../../purchases/domain/entity/purchase_entity.dart';
import '../entity/chart_of_accounts_entity.dart';
import '../usecase/chart_of_accounts_usecase.dart';

abstract class ChartOfAccountsRepository {
  Future<Either<Failure, List<ChartOfAccountsEntity>>> fetchChartOfAccounts();
  Future<Either<Failure, List<PurchaseEntity>>> fetchAccountCodeReport(String code);
  Future<Either<Failure, ResponseModel>> addItemChartOfAccounts(AddChartOfAccountsParams params);
  Future<Either<Failure, ResponseModel>> deleteItemChartOfAccounts(AddChartOfAccountsParams params);
}