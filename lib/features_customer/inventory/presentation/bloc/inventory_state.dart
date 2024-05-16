import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hebauto/features_customer/inventory/domain/entity/inventory_entity_customer.dart';

part 'inventory_state.freezed.dart';

enum InventoryStatus { initial, success, error, loading }

extension InventoryStatusX on InventoryStatus {
  bool get isInitial => this == InventoryStatus.initial;

  bool get isSuccess => this == InventoryStatus.success;

  bool get isError => this == InventoryStatus.error;

  bool get isLoading => this == InventoryStatus.loading;
}

@freezed
abstract class CustomerInventoryState with _$CustomerInventoryState {
  factory CustomerInventoryState({
    @Default(false) bool success,
    @Default('') String message,
    @Default('') String prePageUrl,
    @Default('') String nextPageUrl,
    @Default('') String firstPageUrl,
    @Default('') String lastPageUrl,
    @Default(0) int currentPage,
    @Default(0) int lastPage,
    @Default(<ItemEntityCustomer>[]) List<ItemEntityCustomer> data,
    @Default(InventoryStatus.initial) InventoryStatus status,
  }) = _CustomerInventoryState;
}
