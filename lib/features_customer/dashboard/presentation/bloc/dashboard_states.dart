
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/inventory_stats_entity.dart';
import '../pages/dashboard_main.dart';

part 'dashboard_states.freezed.dart';

enum DashboardStatus { initial, success, error, loading }

extension DashboardStatusX on DashboardStatus {
  bool get isInitial => this == DashboardStatus.initial;
  bool get isSuccess => this == DashboardStatus.success;
  bool get isError => this == DashboardStatus.error;
  bool get isLoading => this == DashboardStatus.loading;
}

@freezed
abstract class DashboardState with _$DashboardState {
  factory DashboardState({
    @Default('') String message,
    //@Default(0) int screen,
    // @Default(SizedBox()) Widget screen,
    @Default(Center(
      child: DashboardMain(),
    )) Widget screen,
    @Default(InventoryStatsEntity()) InventoryStatsEntity inventoryStatsEntity,
    @Default(DashboardStatus.initial) DashboardStatus status,
  }) = _DashboardState;
}