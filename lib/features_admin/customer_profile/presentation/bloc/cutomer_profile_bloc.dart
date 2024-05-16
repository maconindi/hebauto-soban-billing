import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/failure.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecase/customer_profile_usecase.dart';
import 'customer_profile_event.dart';
import 'customer_profile_state.dart';

@injectable
class CustomerProfileBloc
    extends Bloc<CustomerProfileEvent, CustomerProfileState> {
  CustomerProfileBloc(this.usecase) : super(CustomerProfileState()) {
    on<AddCustomerEvent>(_addCustomerEvent);
    on<FetchCustomersEvent>(_showCustomersEvent);
    on<UpdateCustomerEvent>(_updateCustomerEvent);
    on<DeleteCustomerEvent>(_deleteCustomerEvent);
  }

  CustomerProfileUseCase usecase;

  Future<void> _addCustomerEvent(
      AddCustomerEvent event, Emitter<CustomerProfileState> emit) async {
    emit(state.copyWith(status: CustomerProfileStatus.loading));
    try {
      final response = await usecase.repository.addCustomer(event.params);
      response.fold((error) {
        emit(
          state.copyWith(
              status: CustomerProfileStatus.error,
              message: error.getErrorMessage()),
        );
      }, (res) {
        if (res.status == false) {
          emit(state.copyWith(
              status: CustomerProfileStatus.error, message: res.message));
        } else {
          emit(
            state.copyWith(
                status: CustomerProfileStatus.success, message: res.message),
          );
        }
      });
    } on Exception catch (exception) {
      emit(state.copyWith(
          status: CustomerProfileStatus.error, message: exception.toString()));
    }
  }

  Future<void> _showCustomersEvent(
      FetchCustomersEvent event, Emitter<CustomerProfileState> emit) async {
    emit(state.copyWith(status: CustomerProfileStatus.loading));
    try {
      final response = await usecase.repository.showCustomers(page: event.page);
      response.fold((error) {
        emit(
          state.copyWith(
            status: CustomerProfileStatus.error,
            message: error.getErrorMessage(),
          ),
        );
      }, (res) {
        emit(
          state.copyWith(
              success: true,
              status: CustomerProfileStatus.success,
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
          status: CustomerProfileStatus.error, message: exception.toString()));
    }
  }

  Future<void> _updateCustomerEvent(
      UpdateCustomerEvent event, Emitter<CustomerProfileState> emit) async {
    emit(state.copyWith(
      status: CustomerProfileStatus.loading,
    ));
    try {
      final response =
          await usecase.repository.updateCustomer(event.uid, event.params);

      response.fold((error) {
        emit(
          state.copyWith(
            status: CustomerProfileStatus.error,
            message: error.getErrorMessage(),
          ),
        );
      }, (res) {
        emit(
          state.copyWith(
              status: CustomerProfileStatus.success,
              message: 'Item Updated Successfully'),
        );
      });
    } on Exception catch (exception) {
      emit(state.copyWith(
        status: CustomerProfileStatus.error,
        message: exception.toString(),
      ));
    }
  }

  Future<void> _deleteCustomerEvent(
      DeleteCustomerEvent event, Emitter<CustomerProfileState> emit) async {
    emit(state.copyWith(
      status: CustomerProfileStatus.loading,
    ));
    try {
      final response = await usecase.repository.deleteCustomer(event.uid);

      response.fold((error) {
        emit(
          state.copyWith(
            status: CustomerProfileStatus.error,
            message: error.getErrorMessage(),
          ),
        );
      }, (res) {
        emit(
          state.copyWith(
            status: CustomerProfileStatus.success,
            message: res.message,
          ),
        );
      });
    } on Exception catch (exception) {
      emit(state.copyWith(
        status: CustomerProfileStatus.error,
        message: exception.toString(),
      ));
    }
  }
}
