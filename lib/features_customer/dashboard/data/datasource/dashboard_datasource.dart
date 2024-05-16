

import 'package:dartz/dartz.dart';
import 'package:hebauto/core/models/response_model.dart';
import 'package:hebauto/core/network/api/api.dart';
import 'package:hebauto/features_customer/dashboard/data/model/inventory_stats_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/services/hive/main_box.dart';
import '../../domain/entity/inventory_stats_entity.dart';

abstract class CustomerDashboardDataSource {
  Future<Either<Failure, InventoryStatsEntity>> fetchInventoryStats();
}

@injectable
class CustomerDashboardDatasourceImpl implements CustomerDashboardDataSource {
  CustomerDashboardDatasourceImpl(this._client);

  final DioClient _client;

  @override
  Future<Either<Failure, InventoryStatsEntity>> fetchInventoryStats() async {
    final response = await _client.postRequest(ListAPI.fetchInventoryStats,
        converter: (response) {
      final result = ResponseModel.fromJson(response);

      return InventoryStatsModel.fromJson(result.item ?? {});
    }, data: {
      'cus_email': '${(MainBoxMixin.mainBox?.get(MainBoxKeys.email.name))}'
    });
    return response;
  }
}
