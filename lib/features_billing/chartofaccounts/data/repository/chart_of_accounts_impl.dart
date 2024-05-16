import 'package:dartz/dartz.dart';

import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/core/models/response_model.dart';

import 'package:injectable/injectable.dart';

import '../../../purchases/domain/entity/purchase_entity.dart';
import '../../domain/entity/chart_of_accounts_entity.dart';
import '../../domain/repository/chart_of_accounts_repository.dart';
import '../../domain/usecase/chart_of_accounts_usecase.dart';
import '../datasource/chart_of_accounts_datasource.dart';


@Injectable(as: ChartOfAccountsRepository)
class ChartOfAccountsRepositoryImpl extends ChartOfAccountsRepository {
  ChartOfAccountsRepositoryImpl(this.dataSource);
  final ChartOfAccountsDatasource dataSource;

  @override
  Future<Either<Failure, List<ChartOfAccountsEntity>>> fetchChartOfAccounts() async {

    final response = await dataSource.fetchChartOfAccounts();
    return response.fold(
      Left.new,
      Right.new,
    );
  }

  @override
  Future<Either<Failure, ResponseModel>> addItemChartOfAccounts(AddChartOfAccountsParams params) async {
    final response = await dataSource.addItemChartOfAccounts(params);
    return response.fold(
      Left.new,
      Right.new,
    );
  }

  @override
  Future<Either<Failure, ResponseModel>> deleteItemChartOfAccounts(AddChartOfAccountsParams params) async {
    final response = await dataSource.deleteItemChartOfAccounts(params);
    return response.fold(
      Left.new,
      Right.new,
    );
  }

  @override
  Future<Either<Failure, List<PurchaseEntity>>> fetchAccountCodeReport(String code) async {
    final response = await dataSource.fetchAccountCodeReport(code);
    return response.fold(
      Left.new,
      Right.new,
    );
  }
}