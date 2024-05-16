import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/failure.dart';

import 'package:injectable/injectable.dart';

import '../../../domain/usecases/add_customer_usecase.dart';
import '../dashboard_states.dart';
import 'add_customer_event.dart';
import 'add_customer_state.dart';

@injectable
class AddCustomerBloc extends Bloc<AddCustomerEvent, AddCustomerState> {
  final AddCustomerUseCase usecase;

  AddCustomerBloc(this.usecase) : super(AddCustomerState()) {
    on<AddCustomerEvent>(_addCustomerEvent);
  }

  Future<void> _addCustomerEvent(
      AddCustomerEvent event, Emitter<AddCustomerState> emit) async {


    emit(state.copyWith(status: DashboardStatus.loading));
    try {

      final response = await usecase.repository.addCustomer(event.params);
      response.fold((error) {
        emit(
          state.copyWith(
              status: DashboardStatus.error,
              message: error.getErrorMessage()),
        );
      }, (res) {
        if (res.status == false) {
          emit(state.copyWith(
              status: DashboardStatus.error, message: res.message));
        } else {
          emit(
            state.copyWith(
                status: DashboardStatus.success, message: res.message),
          );
        }
      });
    } catch (exception) {
      emit(state.copyWith(
          status: DashboardStatus.error, message: exception.toString()));
    }
  }
}
