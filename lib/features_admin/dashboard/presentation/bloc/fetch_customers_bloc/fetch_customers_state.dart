import 'package:freezed_annotation/freezed_annotation.dart';


import '../../../../customer_profile/domain/entity/customer_entity.dart';
import '../dashboard_states.dart';

part 'fetch_customers_state.freezed.dart';

@freezed
abstract class FetchCustomersState with _$FetchCustomersState{
  factory FetchCustomersState({
    @Default(false) bool success,
    @Default(<CustomerEntity>[]) List<CustomerEntity> data,
    @Default(CustomerEntity()) CustomerEntity customer,
    @Default('') String message,
    @Default(DashboardStatus.initial) DashboardStatus status,
  }) = _FetchCustomersState;
}
