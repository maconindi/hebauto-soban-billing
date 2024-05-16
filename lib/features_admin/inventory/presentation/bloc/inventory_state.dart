import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hebauto/features_admin/inventory/domain/entity/inventory_entity.dart';

import '../../../dashboard/presentation/bloc/dashboard_states.dart';

part 'inventory_state.freezed.dart';

@freezed
abstract class InventoryState with _$InventoryState{
  factory InventoryState({
    @Default(false) bool success,
    @Default('') String message,
    @Default('') String inventId,
    @Default('') String prePageUrl,
    @Default('') String nextPageUrl,
    @Default('') String firstPageUrl,
    @Default('') String lastPageUrl,
    @Default(0) int currentPage,
    @Default(0) int lastPage,

    @Default(<InventoryItemEntity>[]) List<InventoryItemEntity> data,
    String? view,
    @Default(DashboardStatus.initial) DashboardStatus status,
  }) = _InventoryState;
}

// @freezed
// abstract class CustomerInventoryState with _$CustomerInventoryState {
//   factory CustomerInventoryState({
//     @Default(false) bool success,
//     @Default('') String message,
//     @Default('') String prePageUrl,
//     @Default('') String nextPageUrl,
//     @Default('') String firstPageUrl,
//     @Default('') String lastPageUrl,
//     @Default(0) int currentPage,
//     @Default(0) int lastPage,
//     @Default(<ItemEntityCustomer>[]) List<ItemEntityCustomer> data,
//     @Default(InventoryStatus.initial) InventoryStatus status,
//   }) = _CustomerInventoryState;
// }
