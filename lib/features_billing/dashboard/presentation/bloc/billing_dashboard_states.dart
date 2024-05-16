
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
//import '../../../chartofaccounts/presentation/ui/chart_of_accounts_screen.dart';
//import '../../../purchases/presentation/ui/purchase_order_screen.dart';
import '../../../inventory/presentation/ui/inventory_screen.dart';
//import '../ui/billing_dashboard_main.dart';



part 'billing_dashboard_states.freezed.dart';

enum BillingDashboardStatus { initial, success, error, loading }

extension DashboardStatusX on BillingDashboardStatus {
  bool get isInitial => this == BillingDashboardStatus.initial;
  bool get isSuccess => this == BillingDashboardStatus.success;
  bool get isError => this == BillingDashboardStatus.error;
  bool get isLoading => this == BillingDashboardStatus.loading;
}

@freezed
abstract class BillingDashboardState with _$BillingDashboardState {
  factory BillingDashboardState({
    @Default('') String message,
    //@Default(0) int screen,
    // @Default(SizedBox()) Widget screen,
    @Default(Center(
      child: BillingInventoryScreen(),
    )) Widget screen,
    @Default(BillingDashboardStatus.initial) BillingDashboardStatus status,
  }) = _BillingDashboardState;
}