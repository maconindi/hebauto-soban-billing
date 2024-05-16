import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/failure.dart';
import 'package:hebauto/features_admin/inventory/domain/entity/inventory_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/util/common.dart';
import '../../../dashboard/presentation/bloc/dashboard_states.dart';
import '../../domain/usecases/inventory_usecase.dart';

import 'inventory_event.dart';
import 'inventory_state.dart';

@injectable
class InventoryBloc extends Bloc<InventoryEventX, InventoryState> {
  InventoryBloc(this.usecase) : super(InventoryState()) {
    on<AddInventoryEvent>(_addInventoryEvent);
    on<FetchInventoryEvent>(_fetchInventoryEvent);
    on<UpdateInventoryEvent>(_updateInventoryEvent);
    on<SearchInventoryEvent>(_searchInventoryEvent);
    on<DeleteInventoryEvent>(_deleteInventoryEvent);
  }

  final InventoryUseCase usecase;

  List<InventoryItemEntity> listItems = [];

  Future<void> _updateInventoryEvent(
      UpdateInventoryEvent event, Emitter<InventoryState> emit) async {
    emit(state.copyWith(
      status: DashboardStatus.loading,
      view: event.screen,
    ));
    try {
      final response =
          await usecase.repository.updateInventory(event.uid, event.params);

      response.fold((error) {
        emit(
          state.copyWith(
              status: DashboardStatus.error,
              message: error.getErrorMessage(),
              view: event.screen),
        );
      }, (res) {
        emit(
          state.copyWith(
              status: DashboardStatus.success,
              view: event.screen,
              inventId: event.uid,
              message: 'Item Updated Successfully'),
        );
      });
    } on Exception catch (exception) {
      emit(state.copyWith(
        view: event.screen,
        status: DashboardStatus.error,
        message: exception.toString(),
      ));
    }
  }

  Future<void> _addInventoryEvent(
      AddInventoryEvent event, Emitter<InventoryState> emit) async {
    emit(state.copyWith(status: DashboardStatus.loading, view: event.screen));

    try {
      final response = await usecase.repository.addInventory(
        InventoryParams(
          inventId: event.params.inventId,
          vehicleName: event.params.vehicleName,
          color: event.params.color,
          cusEmail: event.params.cusEmail,
          cusId: event.params.cusId,
          yearOfManufacture: event.params.yearOfManufacture,
          vinNumber: event.params.vinNumber,
          lotNumber: event.params.lotNumber,
          isKey: event.params.isKey,
          cusCompany: event.params.cusCompany,
          cusName: event.params.cusName,
        ),
      );
      response.fold((error) {
        emit(
          state.copyWith(
              status: DashboardStatus.error,
              message: error.getErrorMessage(),
              view: event.screen),
        );
      }, (res) async {
        if (res.status == false) {
          emit(
            state.copyWith(
                status: DashboardStatus.error,
                message: res.message,
                view: event.screen),
          );
        } else {
          // for (var element in event.files) {
          //   try {
          //     String url = element.extension?.contains('pdf') ?? false
          //         ? ListAPI.mediaUpload
          //         : ListAPI.imageUpload;
          //     await getIt<DioClient>().uploadFileRequest(url, converter: (res) {
          //       return FileUploadResponseModel.fromJson(res);
          //     }, data: {
          //       'email': res.item.cusEmail,
          //       'id': res.item.cusId,
          //       'file': element.bytes,
          //       'name': element.name
          //     });
          //   } catch (ex) {
          //     debugPrint('Uploading Exception ${ex.toString()}');
          //   }
          // }
          emit(
            state.copyWith(
              status: DashboardStatus.success,
              message: res.message,
              inventId: event.params.inventId,
              view: event.screen,
            ),
          );
        }
      });
    } on Exception catch (exception) {
      emit(state.copyWith(
        status: DashboardStatus.error,
        message: exception.toString(),
        view: event.screen,
      ));
    }
  }

  Future<void> _fetchInventoryEvent(
      FetchInventoryEvent event, Emitter<InventoryState> emit) async {
    emit(state.copyWith(
      status: DashboardStatus.loading,
      view: event.screen,
    ));
    try {
      final response =
          await usecase.repository.fetchInventory(page: event.page);
      response.fold((error) {
        emit(
          state.copyWith(
              status: DashboardStatus.error,
              message: error.getErrorMessage(),
              view: event.screen),
        );
      }, (res) {
        listItems = res.item;
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
        view: event.screen,
        status: DashboardStatus.error,
        message: exception.toString(),
      ));
    }
  }

  Future<void> _searchInventoryEvent(SearchInventoryEvent event, emit) async {
    emit(state.copyWith(status: DashboardStatus.loading));
    try {
      final response = await usecase.repository.searchInventory(
        page: event.page,
        args: event.args,
        category: getCategorySearchParam(event.category),
      );
      response.fold((error) {
        emit(
          state.copyWith(
              status: DashboardStatus.error, message: error.toString()),
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
          status: DashboardStatus.error, message: exception.toString()));
    }
  }

  Future<void> _deleteInventoryEvent(DeleteInventoryEvent event, emit) async {
    // emit(state.copyWith(
    //   status: DashboardStatus.loading,
    // ));
    try {
      final response = await usecase.repository.deleteInventory(event.id);

      response.fold((error) {
        emit(
          state.copyWith(
            status: DashboardStatus.error,
            message: error.getErrorMessage(),
          ),
        );
      }, (res) {


        listItems.removeWhere((element) => element.inventId == event.id);
        emit(
          state.copyWith(
            status: DashboardStatus.success,
            message: res.message,
            data: listItems
          ),
        );
      });
    } on Exception catch (exception) {
      emit(state.copyWith(
        status: DashboardStatus.error,
        message: exception.toString(),
      ));
    }
  }
}
