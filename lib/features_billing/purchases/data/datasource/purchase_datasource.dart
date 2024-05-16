import 'package:dartz/dartz.dart';
import 'package:hebauto/core/models/paginated_model.dart';
import 'package:hebauto/core/models/response_model.dart';
import 'package:hebauto/core/network/api/api.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entity/purchase_entity.dart';
import '../../domain/usecase/purchases_usecase.dart';
import '../model/purchase_model.dart';

abstract class PurchaseDatasource{
  Future<Either<Failure, ResponseModel>> addPurchaseItem(AddPurchasesParams params);
  Future<Either<Failure, PurchaseResponseEntity>> fetchPurchaseItems();
}

@Injectable(as: PurchaseDatasource)
class PurchaseDatasourceImpl extends PurchaseDatasource {

  PurchaseDatasourceImpl(this._dioClient);
  final DioClient _dioClient;
  @override
  Future<Either<Failure, ResponseModel>> addPurchaseItem(AddPurchasesParams params) async {
    final result = await _dioClient.postRequest(ListAPI.addPurchaseItem,
        data: params.toJson(),
        converter: (response) {
          final result= ResponseModel.fromJson(response);
          return result;
        });
    return result;
  }

  @override
  Future<Either<Failure, PurchaseResponseEntity>> fetchPurchaseItems() async {
    final result = await _dioClient.getRequest(ListAPI.fetchPurchaseItems,
        converter: (response) {
          final res = PaginatedModel.fromJson(response, entityName: 'items').data;

          final items = res.dataList.map((e) => PurchaseModel.fromJson(e)).toList();

          return PurchaseModelResponse(
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

        });
    return result;
  }
}


