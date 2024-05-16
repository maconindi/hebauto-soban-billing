class BillingInventoryEntity {

  const BillingInventoryEntity({
    required this.id,
    required this.view,
    required this.costCode,
    required this.date,
    required this.dueDate,
    required this.poNumber,
    required this.supplierName,
    required this.carDetails,
    required this.qtyDelivered,
    required this.account,
    required this.purchasePriceCAD,
    required this.purchasePriceAED,
    required this.taxCost,
  });
  final int id;
  final String view;
  final String costCode;
  final DateTime date;
  final DateTime dueDate;
  final String poNumber;
  final String supplierName;
  final String carDetails;
  final int qtyDelivered;
  final String account;
  final double purchasePriceCAD;
  final double purchasePriceAED;
  final double taxCost;
}