

import '../../domain/entity/purchase_entity.dart';

class PurchaseModelResponse extends PurchaseResponseEntity {
  PurchaseModelResponse(
      {required super.status,
      required super.message,
      required super.item,
      required super.prePageUrl,
      required super.nextPageUrl,
      required super.firstPageUrl,
      required super.lastPageUrl,
      required super.currentPage,
      required super.lastPage});

  factory PurchaseModelResponse.fromJson(Map<String, dynamic> json) {
    return PurchaseModelResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      item: json['item'],
      prePageUrl: json['pre_page_url'] ?? '',
      nextPageUrl: json['next_page_url'] ?? '',
      firstPageUrl: json['first_page_url'] ?? '',
      lastPageUrl: json['last_page_url'] ?? '',
      currentPage: json['current_page'] ?? 1,
      lastPage: json['last_page'] ?? 1,
    );
  }
}

class PurchaseModel extends PurchaseEntity {
  PurchaseModel(
      {required super.purchaseId,
      super.supplierName,
      super.supplierEmail,
      super.billingAddress,
      super.purchaseInvoiceUrl,
      super.issueDate,
      super.dueDate,
      super.description,
      super.purchaseItems,
      super.updatedAt,
      super.createdAt});

  factory PurchaseModel.fromJson(Map<String, dynamic> json) {
    return PurchaseModel(
      purchaseId: json['purchase_id'] ?? '',
      supplierName: json['supplier_name'] ?? '',
      supplierEmail: json['supplier_email'] ?? '',
      billingAddress: json['billing_address'] ?? '',
      purchaseInvoiceUrl: json['purchase_invoice_url'] ?? '',
      issueDate: json['issue_date'] != null
          ? DateTime.parse(json['issue_date'])
          : null,
      dueDate:
          json['due_date'] != null ? DateTime.parse(json['due_date']) : null,
      description: json['description'] ?? '',
      purchaseItems: json['purchase_items'] != null ?  json['purchase_items'].map<PurchaseItemModel>((item) => PurchaseItemModel.fromJson(item ?? {}))
        .toList() : [],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }
}

class PurchaseItemModel extends PurchaseItemEntity {
  PurchaseItemModel(
      {required super.costCode,
      required super.details,
      required super.description,
      required super.account,
      required super.quantity,
      required super.unitPrice,
      required super.amount,
      required super.tax,
      required super.totalPrice,
      required super.purchaseIdFk,
        super.updatedAt,
        super.createdAt, required super.accountCode});

  factory PurchaseItemModel.fromJson(Map<String, dynamic> json) {
    return PurchaseItemModel(
      costCode: json['cost_code'] ?? '',
      details: json['details'] ?? '',
      description: json['description'] ?? '',
      account: json['account'] ?? '',
      quantity: json['quantity'] ?? '',
      unitPrice: json['unit_price'] ?? '',
      amount: json['amount'] ?? '',
      tax: json['tax'] ?? '',
      totalPrice: json['total_price'] ?? '',
      purchaseIdFk: json['purchase_id_fk'] ?? '',
      accountCode: json['account_code'] ?? '',
      // createdAt: json['created_at'] != null
      //     ? DateTime.parse(json['created_at'])
      //     : null,
      // updatedAt: json['updated_at'] != null
      //     ? DateTime.parse(json['updated_at'])
      //     : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cost_code': costCode,
      'details': details,
      'description': description,
      'account': account,
      'account_code': accountCode,
      'quantity': quantity,
      'unit_price': unitPrice,
      'amount': amount,
      'tax': tax,
      'total_price': totalPrice,
      'purchase_id_fk': purchaseIdFk,
      // 'created_at': createdAt,
      // 'updated_at': updatedAt,
    };
  }
}
