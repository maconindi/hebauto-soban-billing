part of 'fetch_report_bloc.dart';

@immutable
sealed class FetchReportEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchReport extends FetchReportEvent {
  final int page;
  final String screen;
  FetchReport({required this.screen, this.page = 1});
  @override
  List<Object> get props => [page];
}

class FilterReport extends FetchReportEvent {
  final FilterReportParams params;
  final String screen;
  final int page;
  FilterReport({required this.params, required this.screen, this.page = 1});
  @override
  List<Object> get props => [params];
}

class DropdownChanged extends FetchReportEvent {
  late String selectedValue;
  late String value;

  DropdownChanged(this.selectedValue, this.value);
}
