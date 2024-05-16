import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';
import '../../domain/entities/report_entitiy.dart';

part 'fetch_report_state.freezed.dart';

@freezed
abstract class ReportState with _$ReportState {
  factory ReportState({
    @Default(false) bool success,
    @Default('') String message,
    @Default('') String inventId,
    @Default('') String prePageUrl,
    @Default('') String nextPageUrl,
    @Default('') String firstPageUrl,
    @Default('') String lastPageUrl,
    @Default(0) int currentPage,
    @Default(0) int lastPage,
    @Default(<ReportItemEntity>[]) List<ReportItemEntity> data,
    Type? view,
    @Default(DashboardStatus.initial) DashboardStatus status,
  }) = _ReportState;
}
