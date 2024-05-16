
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/failure.dart';
import 'package:hebauto/features_admin/pricelist/data/model/pricelist_model.dart';
import 'package:hebauto/features_admin/pricelist/domain/entity/pricelist_entity.dart';
import 'package:hebauto/features_admin/pricelist/domain/usecase/pricelist_usecase.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/upload_file_service.dart';
import 'pricelist_event.dart';
import 'pricelist_state.dart';

@injectable
class PriceListBloc extends Bloc<PriceListEvent, PriceListState> {
  PriceListBloc(this.usecase) : super(PriceListState()) {
    on<AddPriceListEvent>(_addPriceList);
    on<FetchPriceListEvent>(_fetchPriceList);
    on<DeletePriceListEvent>(_deletePriceList);
    on<ResetPriceListEvent>(_resetState);
  }

  final PriceListUseCase usecase;

  List<PriceListEntity>? list;

  Future<void> _resetState(ResetPriceListEvent event, emit) async {
    emit(
        state.copyWith(status: PriceListStatus.initial, data: [], message: ''));
  }

  Future<void> _addPriceList(AddPriceListEvent event, emit) async {

    //debugPrint('im triggred !! ADD');
    emit(state.copyWith(
      status: PriceListStatus.loading,
      view: event.screen,
    ));

    try {
      final res = await FileUploadService.uploadPriceList(
        category: UploadPdfType.OTHER.name,
        customerEmail: event.customer.email,
        file: event.file,
      );

      final response = await usecase.repository.addPriceList(
        params: PriceListParams(
            cusCompany: event.customer.companyName,
            cusId: event.customer.cusId,
            cusEmail: event.customer.email,
            cusName: event.customer.name,
            url: res),
      );

      response.fold((error) {
        emit(
          state.copyWith(
            view: event.screen,
            status: PriceListStatus.error,
            message: error.getErrorMessage(),
          ),
        );
      }, (success) {
        list?.add(PriceListModel(
          url: res,
          createdAt: DateTime.now().toIso8601String(),
          cusCompany: event.customer.companyName,
          cusId: event.customer.cusId,
          cusEmail: event.customer.email,
          cusName: event.customer.name,
        ));

        emit(
          state.copyWith(
            view: event.screen,
            status: PriceListStatus.success,
            data: list ?? [],
            message: 'Pricelist Added!',
          ),
        );
      });
    } on Exception catch (e) {
      emit(state.copyWith(
        view: event.screen,
        status: PriceListStatus.error,
        message: e.toString(),
      ));
    }
  }

  Future<void> _fetchPriceList(FetchPriceListEvent event, emit) async {
    //debugPrint('im triggred !! Fetch');
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
        list = res.item;
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

  Future<void> _deletePriceList(DeletePriceListEvent event, emit) async {
    //debugPrint('im triggred !! Delete');
    emit(state.copyWith(
      status: PriceListStatus.loading,
      view: event.screen,
    ));

    try {
      final response = await usecase.repository.deletePriceList(
        params: PriceListParams(
          cusCompany: event.customer.companyName,
          cusId: event.customer.cusId,
          cusEmail: event.customer.email,
          cusName: event.customer.name,
          url: event.url,
        ),
      );

      response.fold((error) {
        emit(
          state.copyWith(
            view: event.screen,
            status: PriceListStatus.error,
            message: error.getErrorMessage(),
          ),
        );
      }, (success) {
        list?.removeWhere((element) => element.url == event.url);
        emit(
          state.copyWith(
            view: event.screen,
            status: PriceListStatus.success,
            data: list ?? [],
            message: 'Pricelist Deleted!',
          ),
        );
      });
    } on Exception catch (e) {
      emit(state.copyWith(
        view: event.screen,
        status: PriceListStatus.error,
        message: e.toString(),
      ));
    }
  }
}
