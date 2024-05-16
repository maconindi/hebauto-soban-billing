import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/purchase_model.dart';
import '../repository/purchase_repository.dart';

part 'purchases_usecase.freezed.dart';
part 'purchases_usecase.g.dart';



@injectable
class PurchaseUseCase {
  PurchaseUseCase(this.repository);
  final PurchaseRepository repository;
}


@freezed
class AddPurchasesParams with _$AddPurchasesParams {
  const factory AddPurchasesParams({
    @JsonKey(name: 'purchase_id') @Default('') String itemId,
    @JsonKey(name: 'supplier_name') @Default('') String supplierName,
    @JsonKey(name: 'supplier_email') @Default('') String supplierEmail,
    @JsonKey(name: 'billing_address') @Default('') String billingAddress,
    @JsonKey(name: 'purchase_invoice_url') @Default('') String purchaseInvoiceUrl,
    @JsonKey(name: 'issue_date')  DateTime? issueDate,
    @JsonKey(name: 'due_date')  DateTime? dueDate,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'purchase_items')  List<PurchaseItemModel>? items,


  }) = _AddPurchasesParams;

  factory AddPurchasesParams.fromJson(Map<String, dynamic> json) =>
      _$AddPurchasesParamsFromJson(json);
}
