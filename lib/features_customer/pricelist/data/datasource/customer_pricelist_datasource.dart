import 'package:dartz/dartz.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/core/models/paginated_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api/dio_client.dart';
import '../../../../core/network/api/list_api.dart';
import '../../domain/entity/customer_pricelist_entity.dart';
import '../../domain/usecase/customer_pricelist_usecase.dart';
import '../model/customer_pricelist_model.dart';

abstract class CustomerPriceListDataSource{
  Future<Either<Failure, CustomerPriceListResponseEntity>> fetchUserPriceList({required CustomerPriceListParams params});

}


@Injectable(as: CustomerPriceListDataSource)
class PriceListDateSourceImpl implements CustomerPriceListDataSource {

  PriceListDateSourceImpl(this._client);
  final DioClient _client;

  @override
  Future<Either<Failure, CustomerPriceListResponseEntity>> fetchUserPriceList({required CustomerPriceListParams params}) async {
    final response = await _client.postRequest(
      ListAPI.fetchCustomerPriceList,
      data: params.toJson(),
      converter: (response) {
        final res = PaginatedModel.fromJson(response, entityName: 'item').data;
        final items = res.dataList.map((e) => PriceListModel.fromJson(e)).toList();
        return CustomerPriceListResponseModel(
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

}