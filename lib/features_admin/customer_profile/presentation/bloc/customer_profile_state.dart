import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hebauto/features_admin/customer_profile/domain/entity/customer_entity.dart';

part 'customer_profile_state.freezed.dart';


enum CustomerProfileStatus { initial, success, error, loading }

extension CustomerProfileStatusX on CustomerProfileStatus {
  bool get isInitial => this == CustomerProfileStatus.initial;

  bool get isSuccess => this == CustomerProfileStatus.success;

  bool get isError => this == CustomerProfileStatus.error;

  bool get isLoading => this == CustomerProfileStatus.loading;
}

@freezed
abstract class CustomerProfileState with _$CustomerProfileState{
  factory CustomerProfileState({
    @Default(false) bool success,
    @Default('') String message,
    @Default(<CustomerEntity>[]) List<CustomerEntity> data,
    @Default(CustomerProfileStatus.initial) CustomerProfileStatus status,
    @Default('') String view,
    @Default('') String prePageUrl,
    @Default('') String nextPageUrl,
    @Default('') String firstPageUrl,
    @Default('') String lastPageUrl,
    @Default(0) int currentPage,
    @Default(0) int lastPage,
  }) = _CustomerProfileState;
}
