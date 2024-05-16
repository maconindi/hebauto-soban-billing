import 'package:freezed_annotation/freezed_annotation.dart';

import '../dashboard_states.dart';

part 'add_customer_state.freezed.dart';

@freezed
abstract class AddCustomerState with _$AddCustomerState{
  factory AddCustomerState({
    @Default(false) bool success,
    @Default('') String message,
    @Default(DashboardStatus.initial) DashboardStatus status,
  }) = _AddCustomerState;
}
