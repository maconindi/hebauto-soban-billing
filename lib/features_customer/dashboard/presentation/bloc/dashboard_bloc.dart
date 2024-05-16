import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/usecase/usecase.dart';
import 'package:hebauto/core/util/ext/failure.dart';
import 'package:hebauto/features_customer/dashboard/domain/entity/inventory_stats_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecase/dashboard_stats_usecase.dart';
import '../pages/dashboard_main.dart';
import 'dashboard_events.dart';
import 'dashboard_states.dart';

@injectable
class CustomerDashboardBloc
    extends Bloc<CustomerDashboardEventX, DashboardState> {
  CustomerDashboardBloc(this.dashboardStatsUseCase) : super(DashboardState()) {
    on<DashboardStatsEvent>(_fetchDashboardStats);
    on<DashboardChangeScreenEvent>(_changeDashboardScreen);
    on<DashboardResetEvent>(_resetDashBoard);
  }

  final DashboardStatsUseCase dashboardStatsUseCase;

  Future<void> _fetchDashboardStats(event, emit) async {
    emit(state.copyWith(status: DashboardStatus.initial));

    try {
      final response = await dashboardStatsUseCase.call(NoParams());

      return response.fold(
        (error) => emit(
          state.copyWith(
            status: DashboardStatus.error,
            message: error.getErrorMessage(),
          ),
        ),
        (success) => emit(
          state.copyWith(
            status: DashboardStatus.success,
            message: 'Fetched Successfully',
            inventoryStatsEntity: success,
          ),
        ),
      );
    } on Exception catch (ex) {
      ex.toString();
      emit(
        state.copyWith(
            status: DashboardStatus.error,
            message: 'Something went wrong try again!'),
      );
    }
  }

  Future<void> _changeDashboardScreen(
      DashboardChangeScreenEvent event, emit) async {
    emit(
      state.copyWith(screen: event.currentScreen),
    );
  }

  Future<void> _resetDashBoard(DashboardResetEvent event, emit) async {
    emit(
      state.copyWith(
        status: DashboardStatus.initial,
        message: '',
        screen: const Center(
          child: DashboardMain(),
        ),
        inventoryStatsEntity: const InventoryStatsEntity(),
      ),
    );
  }
}
