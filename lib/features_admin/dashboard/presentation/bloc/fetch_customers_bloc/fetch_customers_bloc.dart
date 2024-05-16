// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:hebauto/core/util/ext/failure.dart';
// // import 'package:hebauto/features_admin/dashboard/presentation/bloc/dashboard_states.dart';
// import 'package:hebauto/features_admin/dashboard/presentation/bloc/fetch_customers_bloc/fetch_customers_state.dart';
//
// import 'package:injectable/injectable.dart';
//
// import '../../../domain/usecases/fetch_customers_usecase.dart';
// import 'fetch_customer_event.dart';
//
// @injectable
// class FetchCustomerBloc extends Bloc<FetchCustomersEvent, FetchCustomersState> {
//
//   FetchCustomerBloc(this.usecase) : super(FetchCustomersState()) {
//     //on<FetchCustomersEvent>(_showCustomersEvent);
//     on<UpdateCurrentCustomer>(_updateCurrentCustomer);
//   }
//   final FetchCustomersUseCase usecase;
//   //List<CustomerEntity>? customers;
//
//   // Future<void> _showCustomersEvent(
//   //     FetchCustomersEvent event, Emitter<FetchCustomersState> emit) async {
//   //   emit(state.copyWith(status: DashboardStatus.loading));
//   //   try {
//   //     final response = await usecase.repository.showCustomers();
//   //     response.fold((error) {
//   //       emit(
//   //         state.copyWith(
//   //           status: DashboardStatus.error,
//   //           message: error.getErrorMessage(),
//   //         ),
//   //       );
//   //     }, (res) {
//   //
//   //      // customers = res;
//   //       emit(
//   //         state.copyWith(
//   //             success: true,
//   //             status: DashboardStatus.success,
//   //             data: res,
//   //             message: 'Data Fetched'),
//   //       );
//   //     });
//   //   } catch (exception) {
//   //     emit(state.copyWith(
//   //         status: DashboardStatus.error, message: exception.toString()));
//   //   }
//   // }
//
//   Future<void> _updateCurrentCustomer(
//       UpdateCurrentCustomer event, Emitter<FetchCustomersState> emit) async {
//     emit(state.copyWith(customer: event.entity));
//
//   }
//
//
//
// }
