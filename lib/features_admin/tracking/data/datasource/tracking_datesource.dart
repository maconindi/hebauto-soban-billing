import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/models/response_model.dart';
import '../../../../core/network/api/dio_client.dart';
import '../../../../core/network/api/list_api.dart';
import '../../domain/entity/track_item_entity.dart';
import '../../domain/usecase/track_inventory_usecase.dart';
import '../model/track_item_model.dart';

abstract class TrackInventoryItemRemoteDataSource {
  Future<Either<Failure, TrackItemEntity>> trackInventory(
      AdminTrackingParams params);
}

@injectable
class TrackInventoryRemoteDataSourceImpl
    implements TrackInventoryItemRemoteDataSource {

  TrackInventoryRemoteDataSourceImpl(this._client);
  final DioClient _client;

  @override
  Future<Either<Failure, TrackItemEntity>> trackInventory(AdminTrackingParams params) async {
    final response = await _client.getRequest(
      ListAPI.trackInventoryItem,
      queryParameters: params.toJson(),
      converter: (response) {
        final res = ResponseModel.fromJson(response);
        return TrackItemModel.fromJson(res.item ?? {});
      },
    );
    return response;
  }
}
