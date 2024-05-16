// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddPurchasesParamsImpl _$$AddPurchasesParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$AddPurchasesParamsImpl(
      itemId: json['purchase_id'] as String? ?? '',
      supplierName: json['supplier_name'] as String? ?? '',
      supplierEmail: json['supplier_email'] as String? ?? '',
      billingAddress: json['billing_address'] as String? ?? '',
      purchaseInvoiceUrl: json['purchase_invoice_url'] as String? ?? '',
      issueDate: json['issue_date'] == null
          ? null
          : DateTime.parse(json['issue_date'] as String),
      dueDate: json['due_date'] == null
          ? null
          : DateTime.parse(json['due_date'] as String),
      description: json['description'] as String? ?? '',
      items: (json['purchase_items'] as List<dynamic>?)
          ?.map((e) => PurchaseItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AddPurchasesParamsImplToJson(
        _$AddPurchasesParamsImpl instance) =>
    <String, dynamic>{
      'purchase_id': instance.itemId,
      'supplier_name': instance.supplierName,
      'supplier_email': instance.supplierEmail,
      'billing_address': instance.billingAddress,
      'purchase_invoice_url': instance.purchaseInvoiceUrl,
      'issue_date': instance.issueDate?.toIso8601String(),
      'due_date': instance.dueDate?.toIso8601String(),
      'description': instance.description,
      'purchase_items': instance.items,
    };
