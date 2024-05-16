import 'package:dartz/dartz.dart';
import 'package:hebauto/core/models/response_model.dart';
import 'package:hebauto/core/network/api/api.dart';
import 'package:hebauto/features_billing/purchases/data/model/purchase_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../purchases/domain/entity/purchase_entity.dart';
import '../../domain/entity/chart_of_accounts_entity.dart';
import '../../domain/usecase/chart_of_accounts_usecase.dart';
import '../model/chart_of_accounts_model.dart';

abstract class ChartOfAccountsDatasource {
  Future<Either<Failure, List<ChartOfAccountsEntity>>> fetchChartOfAccounts();
  Future<Either<Failure, List<PurchaseEntity>>> fetchAccountCodeReport(String code);
  Future<Either<Failure, ResponseModel>> addItemChartOfAccounts(AddChartOfAccountsParams params);
  Future<Either<Failure, ResponseModel>> deleteItemChartOfAccounts(AddChartOfAccountsParams params);
}

@Injectable(as: ChartOfAccountsDatasource)
class ChartOfAccountsDatasourceImpl extends ChartOfAccountsDatasource {
  ChartOfAccountsDatasourceImpl(this._dioClient);

  final DioClient _dioClient;

  @override
  Future<Either<Failure, List<ChartOfAccountsEntity>>>
      fetchChartOfAccounts() async {
    final result = await _dioClient.getRequest(ListAPI.fetchAccountOfCharts,
        converter: (response) {
      try {
        final responseItems = ResponseModelList.fromJson(response);
        final  mappedItems = responseItems.item.map((e) => ChartsOfAccountModel.fromJson(e)).toList();
        return mappedItems;
      } on Exception catch (e) {
        return [] as List<ChartsOfAccountModel>;
      }
    });
    return result;
  }

  @override
  Future<Either<Failure, ResponseModel>>
  addItemChartOfAccounts(AddChartOfAccountsParams params) async {
    final result = await _dioClient.postRequest(ListAPI.addItemChartOfAccounts,
        data: params.toJson(),
        converter: (response) {
            final result= ResponseModel.fromJson(response);
            return result;
        });
    return result;
  }

  @override
  Future<Either<Failure, ResponseModel>>
  deleteItemChartOfAccounts(AddChartOfAccountsParams params) async {
    final result = await _dioClient.postRequest(ListAPI.deleteItemChartOfAccounts,
        data: params.toJson(),
        converter: (response) {
          final result= ResponseModel.fromJson(response);
          return result;
        });
    return result;
  }

  @override
  Future<Either<Failure, List<PurchaseEntity>>> fetchAccountCodeReport(String code) async {
    final result = await _dioClient.postRequest(ListAPI.fetchAccountCodeReport,
        data: {'code' : code},
        converter: (response) {
          try {
            final responseItems = ResponseModelList.fromJson(response);
            final  mappedItems = responseItems.item.map((e) => PurchaseModel.fromJson(e)).toList();
            return mappedItems;
          } on Exception catch (e) {
            return [] as List<PurchaseModel>;
          }
        });
    return result;
  }
}
