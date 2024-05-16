import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hebauto/core/util/ext/failure.dart';
import 'package:hebauto/features_admin/admin_report/domain/usecases/report_usecase.dart';
import 'package:hebauto/features_admin/admin_report/persentation/bloc/fetch_report_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../../dashboard/presentation/bloc/dashboard_states.dart';

import '../../domain/usecases/filter_report_usecase.dart';
import '../pages/display_report.dart';
part 'fetch_report_event.dart';

@injectable
class FetchReportBloc extends Bloc<FetchReportEvent, ReportState> {
  final ReportUseCase usecase;
  final FilterReportUseCase filterUsecase;
  FetchReportBloc(this.usecase, this.filterUsecase) : super(ReportState()) {
    on<FetchReport>(_fetchReportEvent);
    on<FilterReport>(_filterReportEvent);
  }

  Future<void> _fetchReportEvent(
      FetchReport event, Emitter<ReportState> emit) async {
    emit(state.copyWith(
      status: DashboardStatus.loading,
      view: DisplayReportScreen,
    ));
    try {
      log('${event.page}');
      final response = await usecase.repository.fetchReport(page: event.page);
      response.fold((error) {
        emit(
          state.copyWith(
              status: DashboardStatus.error,
              message: error.getErrorMessage(),
              view: DisplayReportScreen),
        );
      }, (res) {
        emit(
          state.copyWith(
              status: DashboardStatus.success,
              data: res.item,
              firstPageUrl: res.firstPageUrl,
              lastPageUrl: res.lastPageUrl,
              currentPage: res.currentPage,
              lastPage: res.lastPage,
              prePageUrl: res.prePageUrl,
              nextPageUrl: res.nextPageUrl,
              message: 'Data Fetched'),
        );
      });
    } on Exception catch (exception) {
      emit(state.copyWith(
        view: DisplayReportScreen,
        status: DashboardStatus.error,
        message: exception.toString(),
      ));
    }
  }

  Future<void> _filterReportEvent(
      FilterReport event, Emitter<ReportState> emit) async {
    emit(state.copyWith(
      status: DashboardStatus.loading,
      view: DisplayReportScreen,
    ));
    try {
      log('${event.params}');
      final response =
          await filterUsecase.repository.filterReport(event.params);
      response.fold((error) {
        emit(
          state.copyWith(
              status: DashboardStatus.error,
              message: error.getErrorMessage(),
              view: DisplayReportScreen),
        );
      }, (res) {
        emit(
          state.copyWith(
              status: DashboardStatus.success,
              data: res.item,
              firstPageUrl: res.firstPageUrl,
              lastPageUrl: res.lastPageUrl,
              currentPage: res.currentPage,
              lastPage: res.lastPage,
              prePageUrl: res.prePageUrl,
              nextPageUrl: res.nextPageUrl,
              message: 'Data Fetched'),
        );
      });
    } on Exception catch (exception) {
      emit(state.copyWith(
        view: DisplayReportScreen,
        status: DashboardStatus.error,
        message: exception.toString(),
      ));
    }
  }
}
