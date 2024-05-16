
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/failure.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecase/customer_pricelist_usecase.dart';
import 'pricelist_event.dart';
import 'pricelist_state.dart';

@injectable
class CustomerPriceListBloc extends Bloc<CustomerPriceListEvent, CustomerPriceListState> {
  CustomerPriceListBloc(this.usecase) : super(CustomerPriceListState()) {
    on<FetchPriceListEvent>(_fetchPriceList);
    on<ResetPriceListEvent>(_resetState);
  }

  final CustomerPriceListUseCase usecase;



  Future<void> _resetState(ResetPriceListEvent event, emit) async {
    emit(
        state.copyWith(status: PriceListStatus.initial, data: [], message: ''));
  }


  Future<void> _fetchPriceList(FetchPriceListEvent event, emit) async {
    emit(state.copyWith(
      status: PriceListStatus.loading,
      view: event.screen,
    ));
    try {
      final response = await usecase.call(event.params);
      response.fold((error) {
        emit(
          state.copyWith(
              status: PriceListStatus.error,
              message: error.getErrorMessage(),
              view: event.screen),
        );
      }, (res) {

        emit(
          state.copyWith(
              status: PriceListStatus.success,
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
        view: event.screen,
        status: PriceListStatus.error,
        message: exception.toString(),
      ));
    }
  }

}
