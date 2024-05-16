
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/customer_pricelist_entity.dart';

part 'pricelist_state.freezed.dart';

enum PriceListStatus { initial, success, error, loading }

extension TrackingStatusX on PriceListStatus {
  bool get isInitial => this == PriceListStatus.initial;

  bool get isSuccess => this == PriceListStatus.success;

  bool get isError => this == PriceListStatus.error;

  bool get isLoading => this == PriceListStatus.loading;
}

@freezed
abstract class CustomerPriceListState with _$CustomerPriceListState{
  factory CustomerPriceListState({
    @Default(false) bool success,
    @Default('') String message,
    @Default(<CustomerPriceListEntity>[]) List<CustomerPriceListEntity> data,
    @Default(PriceListStatus.initial) PriceListStatus status,
    @Default('') String view,
    @Default('') String prePageUrl,
    @Default('') String nextPageUrl,
    @Default('') String firstPageUrl,
    @Default('') String lastPageUrl,
    @Default(0) int currentPage,
    @Default(0) int lastPage,
  }) = _CustomerPriceListState;
}



