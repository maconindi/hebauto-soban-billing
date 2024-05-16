
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/models/models_util.dart';
import '../../domain/usecase/chart_of_accounts_usecase.dart';
import 'chart_of_accounts_state.dart';





@injectable
class ChartOfAccountsCubit extends Cubit<ChartOfAccountsState> {
  ChartOfAccountsCubit(this.useCase) : super(ChartOfAccountsState());

  ChartOfAccountsUseCase useCase;

  List<Groups> groups = [];
  List<Accounts> accounts = [];
  List<Accounts> subAccounts = [];


  String getGroupType(int index) {
    // Create a map to store integer to string mappings
    final stringMap = <int, String>{
      1: 'Assets',
      5: 'Income',
      4: 'Cost Of Sales',
      3: 'Equity',
      2: 'Liabilities',
      6: 'Expenses',
    };

    // Use the map to return the corresponding string value
    return stringMap[index] ?? '';
  }

  int getGroupTypeIndex(String value) {
    // Create a map to store string-value to integer mappings
    final indexMap = <String, int>{
      'Assets': 1,
      'Income': 5,
      'Cost Of Sales': 4,
      'Equity': 3,
      'Liabilities': 2,
      'Expenses': 6,
    };

    // Use the map to return the corresponding integer value
    return indexMap[value] ??
        0; // Return 0 if the value is not found in the map
  }





  Future<void> fetchAccountsList() async {
    emit(state.copyWith(status: ChartOfAccountsStatus.loading));

    try {
      final result = await useCase.repository.fetchChartOfAccounts();

      result.fold((error) {
        emit(state.copyWith(
            status: ChartOfAccountsStatus.error,
            message: 'Something went Wrong!'));
      }, (result) {

        groups = result
            .where((element) => element.level == 2)
            .map((e) => Groups(e.itemId, e.parentItemId, e.name,
            getGroupType(e.parentItemId)))
            .toList();
        accounts = result
            .where((element) => element.level == 3)
            .map((e) =>
            Accounts(e.itemId, e.parentItemId, e.name, e.code))
            .toList();
        subAccounts = result
            .where((element) => element.level == 4)
            .map((e) =>
            Accounts(e.itemId, e.parentItemId, e.name, e.code))
            .toList();

        emit(state.copyWith(
            status: ChartOfAccountsStatus.success,
            accountsList: accounts,
            groupsList: groups,
            subAccountsList: subAccounts,
            message: 'Data Fetched',
            data: result));
      });
    } on Exception {
      emit(state.copyWith(
          status: ChartOfAccountsStatus.error,
          message: 'Something went Wrong!'));
    }
  }

  Future<void> fetchAccountsCodeReport(String code) async {
    emit(state.copyWith(status: ChartOfAccountsStatus.loading));

    try {
      final result = await useCase.repository.fetchAccountCodeReport(code);

      result.fold((error) {
        emit(state.copyWith(
            status: ChartOfAccountsStatus.error,
            message: 'Something went Wrong!'));
      }, (result) {

        emit(state.copyWith(
            status: ChartOfAccountsStatus.success,
            message: 'Data Fetched',
            reportData: result));
      });
    } on Exception {
      emit(state.copyWith(
          status: ChartOfAccountsStatus.error,
          message: 'Something went Wrong!'));
    }
  }



  Future<void> addItemChartOfAccounts(AddChartOfAccountsParams params, bool isGroup) async {
    emit(state.copyWith(status: ChartOfAccountsStatus.loading));

    try {
      final result = await useCase.repository.addItemChartOfAccounts(params);

      result.fold((error) {
        emit(state.copyWith(
            status: ChartOfAccountsStatus.error,
            message: 'Something went Wrong!'));
      }, (result) {

        if(params.level == 2){
          groups.add(Groups(params.itemId, params.parentItemId, params.name, getGroupType(params.parentItemId)));
        }else if (params.level == 3) {
          accounts.add(Accounts(params.itemId, params.parentItemId, params.name, params.code));
        }else{
          subAccounts.add(Accounts(params.itemId, params.parentItemId, params.name, params.code));
        }

        emit(state.copyWith(
          status: ChartOfAccountsStatus.success,
          //groupsList: groups,
          message: 'Data Fetched',
        ));
      });
    } on Exception {

      emit(state.copyWith(
          status: ChartOfAccountsStatus.error,
          message: 'Something went Wrong!'));
    }
  }

  Future<void> deleteItemChartOfAccounts(AddChartOfAccountsParams params, bool isGroup) async {
    emit(state.copyWith(status: ChartOfAccountsStatus.loading));

    try {
      final result = await useCase.repository.deleteItemChartOfAccounts(params);

      result.fold((error) {
        emit(state.copyWith(
            status: ChartOfAccountsStatus.error,
            message: 'Something went Wrong!'));
      }, (result) {

        if(isGroup){

          groups.removeWhere((element) => element.parentId == params.itemId || element.groupName == params.name);


          // groups.add(Groups(params.itemId, params.parentItemId, params.name, getGroupType(params.parentItemId)));
        }else{
          accounts.add(Accounts(params.itemId, params.parentItemId, params.name, params.code));
        }

        emit(state.copyWith(
          status: ChartOfAccountsStatus.success,
          //groupsList: groups,
          message: 'Data Fetched',
        ));
      });
    } on Exception {

      emit(state.copyWith(
          status: ChartOfAccountsStatus.error,
          message: 'Something went Wrong!'));
    }
  }
}
