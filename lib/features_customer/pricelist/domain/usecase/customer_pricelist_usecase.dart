import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

import '../entity/customer_pricelist_entity.dart';
import '../repository/customer_pricelist_repository.dart';

part 'customer_pricelist_usecase.freezed.dart';
part 'customer_pricelist_usecase.g.dart';

@injectable
class CustomerPriceListUseCase extends UseCase<CustomerPriceListResponseEntity, CustomerPriceListParams>{
  CustomerPriceListUseCase(this.repository);
  final CustomerPriceListRepository repository;
  @override
  Future<Either<Failure, CustomerPriceListResponseEntity>> call(CustomerPriceListParams params) => repository.fetchPriceList(params: params);
}



@freezed
class CustomerPriceListParams with _$CustomerPriceListParams{
  const factory CustomerPriceListParams({

    @JsonKey(name: 'cus_email') @Default('') String cusEmail,

  }) = _CustomerPriceListParams;

  factory CustomerPriceListParams.fromJson(Map<String, dynamic> json) =>
      _$CustomerPriceListParamsFromJson(json);
}
