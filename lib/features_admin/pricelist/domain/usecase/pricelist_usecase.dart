import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hebauto/core/error/failure.dart';
import 'package:hebauto/core/usecase/usecase.dart';
import 'package:hebauto/features_admin/pricelist/domain/entity/pricelist_entity.dart';
import 'package:hebauto/features_admin/pricelist/domain/repository/pricelist_repository.dart';
import 'package:injectable/injectable.dart';

part 'pricelist_usecase.freezed.dart';
part 'pricelist_usecase.g.dart';

@injectable
class PriceListUseCase extends UseCase<PriceListResponseEntity, PriceListParams>{
  PriceListUseCase(this.repository);
  final PriceListRepository repository;
  @override
  Future<Either<Failure, PriceListResponseEntity>> call(PriceListParams params) => repository.fetchPriceList(params: params);
}



@freezed
class PriceListParams with _$PriceListParams{
  const factory PriceListParams({


    @JsonKey(name: 'url') @Default('') String url,
    @JsonKey(name: 'cus_email') @Default('') String cusEmail,
    @JsonKey(name: 'cus_name') @Default('') String cusName,
    @JsonKey(name: 'cus_company') @Default('') String cusCompany,
    @JsonKey(name: 'cus_id_fk') @Default('') String cusId,

  }) = _PriceListParams;

  factory PriceListParams.fromJson(Map<String, dynamic> json) =>
      _$PriceListParamsFromJson(json);
}
