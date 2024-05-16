class PurchaseResponseEntity {

  PurchaseResponseEntity({
    required this.status,
    required this.message,
    required this.item,
    required this.prePageUrl,
    required this.nextPageUrl,
    required this.firstPageUrl,
    required this.lastPageUrl,
    required this.currentPage,
    required this.lastPage,
  });
  final bool status;
  final String message;
  final dynamic item;
  final String prePageUrl;
  final String nextPageUrl;
  final String firstPageUrl;
  final String lastPageUrl;
  final int currentPage;
  final int lastPage;
}

class PurchaseEntity {

  PurchaseEntity({
    required this.purchaseId,
    this.supplierName = '',
    this.supplierEmail = '',
    this.billingAddress = '',
    this.purchaseInvoiceUrl = '',
    this.issueDate,
    this.dueDate,
    this.description = '',
    this.purchaseItems,
    this.createdAt,
    this.updatedAt,
  });
  final String purchaseId;
  final String supplierName;
  final String supplierEmail;
  final String billingAddress;
  final String purchaseInvoiceUrl;
  final DateTime? issueDate;
  final DateTime? dueDate;
  final String description;
  final List<PurchaseItemEntity>? purchaseItems;
  final DateTime? createdAt;
  final DateTime? updatedAt;
}


class InvoiceItemDetailsEntity {
  InvoiceItemDetailsEntity([
    this.costCodeValue = '',
    this.carDetailsValue = '',
    this.descriptionValue = '',
    this.accountsValue = '',
    this.qtyValue = '',
    this.unitPriceValue = '',
    this.amountValue = '',
    this.taxValue = '',
    this.totalCodeValue = '',
  ]);

  String? costCodeValue;
  String? carDetailsValue;
  String? descriptionValue;
  String? accountsValue;
  String? qtyValue;
  String? unitPriceValue;
  String? amountValue;
  String? taxValue;
  String? totalCodeValue;
}



class PurchaseItemEntity {

  PurchaseItemEntity({
    required this.costCode,
    required this.details,
    required this.description,
    required this.account,
    required this.accountCode,
    required this.quantity,
    required this.unitPrice,
    required this.amount,
    required this.tax,
    required this.totalPrice,
    required this.purchaseIdFk,
    this.updatedAt,
    this.createdAt,
  });
  String costCode;
  String details;
  String description;
  String account;
  String accountCode;
  String quantity;
  String unitPrice;
  String amount;
  String tax;
  String totalPrice;
  String purchaseIdFk;
  DateTime? updatedAt;
  DateTime? createdAt;
}
