import 'package:dartz/dartz.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/core/models/response_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/purchase_entity.dart';
import '../../domain/repository/purchase_repository.dart';
import '../../domain/usecase/purchases_usecase.dart';
import '../datasource/purchase_datasource.dart';


@Injectable(as: PurchaseRepository)
class PurchaseRepositoryImpl extends PurchaseRepository{
  PurchaseRepositoryImpl(this.datasource);
  final PurchaseDatasource datasource;

  @override
  Future<Either<Failure, ResponseModel>> addPurchaseItem(AddPurchasesParams params) async {
    final response = await datasource.addPurchaseItem(params);
    return response.fold(
      Left.new,
      Right.new,
    );
  }

  @override
  Future<Either<Failure, PurchaseResponseEntity>> fetchPurchaseItems() async {
    final response = await datasource.fetchPurchaseItems();
    return response.fold(
      Left.new,
      Right.new,
    );
  }
}