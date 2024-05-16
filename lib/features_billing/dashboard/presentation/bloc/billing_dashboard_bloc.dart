import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'billing_dashboard_events.dart';
import 'billing_dashboard_states.dart';



@injectable
class BillingDashboardBloc
    extends Bloc<BillingDashboardEventX, BillingDashboardState> {
  BillingDashboardBloc() : super(BillingDashboardState()) {

    on<DashboardResetEvent>(_resetDashBoard);
    on<DashboardChangeScreenEvent>(_changeDashboardScreen);
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
        status: BillingDashboardStatus.initial,
        message: '',
        screen: const SizedBox.shrink(),
      ),
    );
  }
}