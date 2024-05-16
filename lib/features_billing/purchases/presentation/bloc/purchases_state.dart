import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/purchase_entity.dart';

part 'purchases_state.freezed.dart';


enum PurchasesStatus { initial, success, error, loading }

extension PurchasesStatusX on PurchasesStatus {
  bool get isInitial => this == PurchasesStatus.initial;
  bool get isSuccess => this == PurchasesStatus.success;
  bool get isError => this == PurchasesStatus.error;
  bool get isLoading => this == PurchasesStatus.loading;
}


@freezed
abstract class PurchasesState with _$PurchasesState {
  factory PurchasesState({


    @Default('') String message,
    @Default('') String inventId,
    @Default('') String prePageUrl,
    @Default('') String nextPageUrl,
    @Default('') String firstPageUrl,
    @Default('') String lastPageUrl,
    @Default(0) int currentPage,
    @Default(0) int lastPage,

    @Default(<PurchaseEntity>[]) List<PurchaseEntity> data,
    @Default(PurchasesStatus.initial) PurchasesStatus status,
  }) = _PurchasesState;
}