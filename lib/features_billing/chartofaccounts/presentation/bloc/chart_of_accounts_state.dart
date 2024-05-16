

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hebauto/features_billing/purchases/domain/entity/purchase_entity.dart';

import '../../domain/entity/chart_of_accounts_entity.dart';

import 'package:hebauto/core/models/models_util.dart';



part 'chart_of_accounts_state.freezed.dart';


enum ChartOfAccountsStatus { initial, success, error, loading }

extension ChartOfAccountsStatusX on ChartOfAccountsStatus {
  bool get isInitial => this == ChartOfAccountsStatus.initial;
  bool get isSuccess => this == ChartOfAccountsStatus.success;
  bool get isError => this == ChartOfAccountsStatus.error;
  bool get isLoading => this == ChartOfAccountsStatus.loading;
}


@freezed
abstract class ChartOfAccountsState with _$ChartOfAccountsState {
  factory ChartOfAccountsState({

    @Default('') String message,
    @Default(<ChartOfAccountsEntity>[]) List<ChartOfAccountsEntity> data,
    @Default(<PurchaseEntity>[]) List<PurchaseEntity> reportData,
    @Default(false) bool isAccount,
    @Default(<Accounts>[]) List<Accounts> subAccountsList,
    @Default(<Accounts>[]) List<Accounts> accountsList,
    @Default(<Groups>[]) List<Groups> groupsList,
    @Default(ChartOfAccountsStatus.initial) ChartOfAccountsStatus status,
  }) = _ChartOfAccountsState;
}