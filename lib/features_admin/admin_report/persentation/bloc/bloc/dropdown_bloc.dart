import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../fetch_report_bloc.dart';
import 'drobdown_state.dart';

@injectable
class DropdownBloc extends Bloc<DropdownChanged, DropdownState> {
  DropdownBloc() : super(DropdownState('All'));

  Stream<DropdownState> mapEventToState(DropdownChanged event) async* {
    if (event is DropdownChanged) {
      event.selectedValue = event.value;
    }
  }
}
