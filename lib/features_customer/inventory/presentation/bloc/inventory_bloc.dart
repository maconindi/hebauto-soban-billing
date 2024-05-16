import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/util/common.dart';
import '../../domain/usecases/inventory_usecase.dart';
import 'inventory_event.dart';
import 'inventory_state.dart';

@injectable
class CustomerInventoryBloc
    extends Bloc<CustomerInventoryEventX, CustomerInventoryState> {
  CustomerInventoryBloc(this.usecase) : super(CustomerInventoryState()) {
    on<FetchInventoryEvent>(_fetchInventoryEvent);
    on<SearchInventoryEvent>(_searchInventoryEvent);
  }

  final CustomerInventoryUseCase usecase;

  Future<void> _fetchInventoryEvent(
      FetchInventoryEvent event, Emitter<CustomerInventoryState> emit) async {
    emit(state.copyWith(status: InventoryStatus.loading));

    try {
      final response =
          await usecase.repository.fetchInventory(page: event.page);
      response.fold((error) {
        emit(
          state.copyWith(
              status: InventoryStatus.error, message: error.toString()),
        );
      }, (res) {
        emit(
          state.copyWith(
              status: InventoryStatus.success,
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
          status: InventoryStatus.error, message: exception.toString()));
    }
  }

  Future<void> _searchInventoryEvent(SearchInventoryEvent event, emit) async {
    emit(state.copyWith(status: InventoryStatus.loading));
    try {
      final response = await usecase.repository.searchInventory(
        page: event.page,
        args: event.args,
        category: getCategorySearchParam(event.category),
      );
      response.fold((error) {
        emit(
          state.copyWith(
              status: InventoryStatus.error, message: error.toString()),
        );
      }, (res) {
        emit(
          state.copyWith(
            status: InventoryStatus.success,
            data: res.item,
            firstPageUrl: res.firstPageUrl,
            lastPageUrl: res.lastPageUrl,
            currentPage: res.currentPage,
            lastPage: res.lastPage,
            prePageUrl: res.prePageUrl,
            nextPageUrl: res.nextPageUrl,
            message: 'Data Fetched',
          ),
        );
      });
    } on Exception catch (exception) {
      emit(state.copyWith(
          status: InventoryStatus.error, message: exception.toString()));
    }
  }
}
