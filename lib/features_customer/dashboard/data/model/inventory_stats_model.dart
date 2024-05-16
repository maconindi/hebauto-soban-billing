import 'package:hebauto/features_customer/dashboard/domain/entity/inventory_stats_entity.dart';

class InventoryStatsModel extends InventoryStatsEntity {
  InventoryStatsModel({
    super.totalCount,
    super.totalNewCreated,
    super.totalDeliveredCount,
    super.totalShippingCount,
    super.totalTowingCount,
    super.totalWarehouseCount,
    super.totalStoreCount,
  });

  factory InventoryStatsModel.fromJson(Map<String, dynamic> json) =>
      InventoryStatsModel(
        totalCount: json['total_count'] ?? 0,
        totalNewCreated: json['new_created'] ?? 0,
        totalDeliveredCount: json['delivered'] ?? 0,
        totalShippingCount: json['shipping'] ?? 0,
        totalTowingCount: json['towing'] ?? 0,
        totalWarehouseCount: json['warehouse'] ?? 0,
        totalStoreCount: json['store'] ?? 0,


      );
}
