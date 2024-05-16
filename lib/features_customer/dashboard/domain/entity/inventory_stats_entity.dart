class InventoryStatsEntity {

  const InventoryStatsEntity({
    this.totalCount = 0,
    this.totalShippingCount = 0,
    this.totalNewCreated = 0,
    this.totalTowingCount = 0,
    this.totalWarehouseCount = 0,
    this.totalStoreCount = 0,
    this.totalDeliveredCount = 0,
  });

  final int totalCount;
  final int totalNewCreated;
  final int totalShippingCount;
  final int totalTowingCount;
  final int totalWarehouseCount;
  final int totalStoreCount;
  final int totalDeliveredCount;


}
