
import '../../domain/entity/chart_of_accounts_entity.dart';

class ChartsOfAccountModel extends ChartOfAccountsEntity {
  ChartsOfAccountModel(
      {required super.itemId,
      required super.name,
      required super.code,
      required super.parentItemId,
      required super.level});


  factory ChartsOfAccountModel.fromJson(Map<String, dynamic> json) {
    return ChartsOfAccountModel(
      itemId: json['item_id'] ??  0,
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      parentItemId: json['parent_item_id'] ?? 0,
      level: json['level'] ?? 0,
    );
  }
}
