import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/features_billing/purchases/domain/usecase/purchases_usecase.dart';
import 'package:injectable/injectable.dart';

import 'purchases_state.dart';

@injectable
class PurchasesCubit extends Cubit<PurchasesState> {
  PurchasesCubit(this.useCase) : super(PurchasesState());

  final PurchaseUseCase useCase;

  Future<void> fetchAccountsList() async {
    emit(state.copyWith(status: PurchasesStatus.loading));

    try {
      final result = await useCase.repository.fetchPurchaseItems();

      result.fold((error) {
        emit(state.copyWith(
            status: PurchasesStatus.error, message: 'Something went Wrong!'));
      }, (res) {
        emit(state.copyWith(
          status: PurchasesStatus.success,
          message: 'Data Fetched',
          firstPageUrl: res.firstPageUrl,
          lastPageUrl: res.lastPageUrl,
          currentPage: res.currentPage,
          lastPage: res.lastPage,
          prePageUrl: res.prePageUrl,
          nextPageUrl: res.nextPageUrl,
          data: res.item,
        ));
      });
    } on Exception {
      emit(state.copyWith(
          status: PurchasesStatus.error, message: 'Something went Wrong!'));
    }
  }

  Future<void> addItemChartOfAccounts(
      AddPurchasesParams params) async {
    emit(state.copyWith(status: PurchasesStatus.loading));

    try {
      final result = await useCase.repository.addPurchaseItem(params);

      result.fold((error) {

        debugPrint('>> Im the error king! ${error.toString()}');
        emit(state.copyWith(
            status: PurchasesStatus.error, message: 'Something went Wrong!'));
      }, (result) {
        debugPrint('>> Im the success king!');
        emit(state.copyWith(
          status: PurchasesStatus.success,
          message: 'Data Added Successfully',
        ));
      });
    } on Exception {
      debugPrint('>> Im the exception king!');
      emit(state.copyWith(
          status: PurchasesStatus.error, message: 'Something went Wrong!'));
    }
  }
}
