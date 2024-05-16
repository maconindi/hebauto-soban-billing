import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../repository/chart_of_accounts_repository.dart';

part 'chart_of_accounts_usecase.freezed.dart';
part 'chart_of_accounts_usecase.g.dart';





@injectable
class ChartOfAccountsUseCase {
 ChartOfAccountsUseCase(this.repository);
 final ChartOfAccountsRepository repository;

}


@freezed
class AddChartOfAccountsParams with _$AddChartOfAccountsParams {
 const factory AddChartOfAccountsParams({
  @JsonKey(name: 'item_id') @Default(0) int itemId,
  @JsonKey(name: 'name') @Default('') String name,
  @JsonKey(name: 'code') @Default('') String code,
  @JsonKey(name: 'parent_item_id') @Default(0) int parentItemId,
  @JsonKey(name: 'level') @Default(0) int level,

 }) = _AddChartOfAccountsParams;

 factory AddChartOfAccountsParams.fromJson(Map<String, dynamic> json) =>
     _$AddChartOfAccountsParamsFromJson(json);
}
