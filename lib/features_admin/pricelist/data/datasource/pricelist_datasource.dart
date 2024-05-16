import 'package:dartz/dartz.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/core/models/paginated_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api/dio_client.dart';
import '../../../../core/network/api/list_api.dart';
import '../../domain/entity/pricelist_entity.dart';
import '../../domain/usecase/pricelist_usecase.dart';
import '../model/pricelist_model.dart';

abstract class PriceListDataSource{
  Future<Either<Failure, PriceListResponseEntity>> fetchUserPriceList({required PriceListParams params});
  Future<Either<Failure, PriceListResponseEntity>> addPriceList({required PriceListParams params});
  Future<Either<Failure, PriceListResponseEntity>> deletePriceList({required PriceListParams params});
}


@Injectable(as: PriceListDataSource)
class PriceListDateSourceImpl implements PriceListDataSource {

  PriceListDateSourceImpl(this._client);
  final DioClient _client;

  @override
  Future<Either<Failure, PriceListResponseEntity>> fetchUserPriceList({required PriceListParams params}) async {
    final response = await _client.postRequest(
      ListAPI.fetchPriceList,
      data: params.toJson(),
      converter: (response) {
        final res = PaginatedModel.fromJson(response, entityName: 'item').data;
        final items = res.dataList.map((e) => PriceListModel.fromJson(e)).toList();
        return PriceListResponseModel(
            item: items,
            status: true,
            message: 'Operation Successful',
            prePageUrl: res.prevPageUrl,
            nextPageUrl: res.nextPageUrl,
            firstPageUrl: res.firstPageUrl,
            lastPageUrl: res.lastPageUrl,
            lastPage: res.lastPage,
            currentPage: res.currentPage
        );

      },
    );
    return response;
  }

  @override
  Future<Either<Failure, PriceListResponseEntity>> addPriceList({required PriceListParams params}) async {
    final response = await _client.postRequest(
      ListAPI.addPriceList,
      data: params.toJson(),
      converter: (response) {
        return PriceListResponseModel.fromJson(response);
       // return res;
      },
    );
    return response;
  }

  @override
  Future<Either<Failure, PriceListResponseEntity>> deletePriceList({required PriceListParams params}) async {
    final response = await _client.postRequest(
      ListAPI.deletePriceList,
      data: params.toJson(),
      converter: (response) {
        return PriceListResponseModel.fromJson(response);
       // return res;
      },
    );
    return response;
  }
}