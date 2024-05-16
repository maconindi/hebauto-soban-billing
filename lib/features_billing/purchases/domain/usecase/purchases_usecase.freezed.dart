// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchases_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddPurchasesParams _$AddPurchasesParamsFromJson(Map<String, dynamic> json) {
  return _AddPurchasesParams.fromJson(json);
}

/// @nodoc
mixin _$AddPurchasesParams {
  @JsonKey(name: 'purchase_id')
  String get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_email')
  String get supplierEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'billing_address')
  String get billingAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_invoice_url')
  String get purchaseInvoiceUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'issue_date')
  DateTime? get issueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date')
  DateTime? get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_items')
  List<PurchaseItemModel>? get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddPurchasesParamsCopyWith<AddPurchasesParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPurchasesParamsCopyWith<$Res> {
  factory $AddPurchasesParamsCopyWith(
          AddPurchasesParams value, $Res Function(AddPurchasesParams) then) =
      _$AddPurchasesParamsCopyWithImpl<$Res, AddPurchasesParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'purchase_id') String itemId,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'supplier_email') String supplierEmail,
      @JsonKey(name: 'billing_address') String billingAddress,
      @JsonKey(name: 'purchase_invoice_url') String purchaseInvoiceUrl,
      @JsonKey(name: 'issue_date') DateTime? issueDate,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'purchase_items') List<PurchaseItemModel>? items});
}

/// @nodoc
class _$AddPurchasesParamsCopyWithImpl<$Res, $Val extends AddPurchasesParams>
    implements $AddPurchasesParamsCopyWith<$Res> {
  _$AddPurchasesParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? supplierName = null,
    Object? supplierEmail = null,
    Object? billingAddress = null,
    Object? purchaseInvoiceUrl = null,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? description = null,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      supplierEmail: null == supplierEmail
          ? _value.supplierEmail
          : supplierEmail // ignore: cast_nullable_to_non_nullable
              as String,
      billingAddress: null == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseInvoiceUrl: null == purchaseInvoiceUrl
          ? _value.purchaseInvoiceUrl
          : purchaseInvoiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseItemModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPurchasesParamsImplCopyWith<$Res>
    implements $AddPurchasesParamsCopyWith<$Res> {
  factory _$$AddPurchasesParamsImplCopyWith(_$AddPurchasesParamsImpl value,
          $Res Function(_$AddPurchasesParamsImpl) then) =
      __$$AddPurchasesParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'purchase_id') String itemId,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'supplier_email') String supplierEmail,
      @JsonKey(name: 'billing_address') String billingAddress,
      @JsonKey(name: 'purchase_invoice_url') String purchaseInvoiceUrl,
      @JsonKey(name: 'issue_date') DateTime? issueDate,
      @JsonKey(name: 'due_date') DateTime? dueDate,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'purchase_items') List<PurchaseItemModel>? items});
}

/// @nodoc
class __$$AddPurchasesParamsImplCopyWithImpl<$Res>
    extends _$AddPurchasesParamsCopyWithImpl<$Res, _$AddPurchasesParamsImpl>
    implements _$$AddPurchasesParamsImplCopyWith<$Res> {
  __$$AddPurchasesParamsImplCopyWithImpl(_$AddPurchasesParamsImpl _value,
      $Res Function(_$AddPurchasesParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? supplierName = null,
    Object? supplierEmail = null,
    Object? billingAddress = null,
    Object? purchaseInvoiceUrl = null,
    Object? issueDate = freezed,
    Object? dueDate = freezed,
    Object? description = null,
    Object? items = freezed,
  }) {
    return _then(_$AddPurchasesParamsImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      supplierEmail: null == supplierEmail
          ? _value.supplierEmail
          : supplierEmail // ignore: cast_nullable_to_non_nullable
              as String,
      billingAddress: null == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseInvoiceUrl: null == purchaseInvoiceUrl
          ? _value.purchaseInvoiceUrl
          : purchaseInvoiceUrl // ignore: cast_nullable_to_non_nullable
              as String,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PurchaseItemModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddPurchasesParamsImpl implements _AddPurchasesParams {
  const _$AddPurchasesParamsImpl(
      {@JsonKey(name: 'purchase_id') this.itemId = '',
      @JsonKey(name: 'supplier_name') this.supplierName = '',
      @JsonKey(name: 'supplier_email') this.supplierEmail = '',
      @JsonKey(name: 'billing_address') this.billingAddress = '',
      @JsonKey(name: 'purchase_invoice_url') this.purchaseInvoiceUrl = '',
      @JsonKey(name: 'issue_date') this.issueDate,
      @JsonKey(name: 'due_date') this.dueDate,
      @JsonKey(name: 'description') this.description = '',
      @JsonKey(name: 'purchase_items') final List<PurchaseItemModel>? items})
      : _items = items;

  factory _$AddPurchasesParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddPurchasesParamsImplFromJson(json);

  @override
  @JsonKey(name: 'purchase_id')
  final String itemId;
  @override
  @JsonKey(name: 'supplier_name')
  final String supplierName;
  @override
  @JsonKey(name: 'supplier_email')
  final String supplierEmail;
  @override
  @JsonKey(name: 'billing_address')
  final String billingAddress;
  @override
  @JsonKey(name: 'purchase_invoice_url')
  final String purchaseInvoiceUrl;
  @override
  @JsonKey(name: 'issue_date')
  final DateTime? issueDate;
  @override
  @JsonKey(name: 'due_date')
  final DateTime? dueDate;
  @override
  @JsonKey(name: 'description')
  final String description;
  final List<PurchaseItemModel>? _items;
  @override
  @JsonKey(name: 'purchase_items')
  List<PurchaseItemModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AddPurchasesParams(itemId: $itemId, supplierName: $supplierName, supplierEmail: $supplierEmail, billingAddress: $billingAddress, purchaseInvoiceUrl: $purchaseInvoiceUrl, issueDate: $issueDate, dueDate: $dueDate, description: $description, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPurchasesParamsImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.supplierEmail, supplierEmail) ||
                other.supplierEmail == supplierEmail) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.purchaseInvoiceUrl, purchaseInvoiceUrl) ||
                other.purchaseInvoiceUrl == purchaseInvoiceUrl) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      itemId,
      supplierName,
      supplierEmail,
      billingAddress,
      purchaseInvoiceUrl,
      issueDate,
      dueDate,
      description,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPurchasesParamsImplCopyWith<_$AddPurchasesParamsImpl> get copyWith =>
      __$$AddPurchasesParamsImplCopyWithImpl<_$AddPurchasesParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddPurchasesParamsImplToJson(
      this,
    );
  }
}

abstract class _AddPurchasesParams implements AddPurchasesParams {
  const factory _AddPurchasesParams(
      {@JsonKey(name: 'purchase_id') final String itemId,
      @JsonKey(name: 'supplier_name') final String supplierName,
      @JsonKey(name: 'supplier_email') final String supplierEmail,
      @JsonKey(name: 'billing_address') final String billingAddress,
      @JsonKey(name: 'purchase_invoice_url') final String purchaseInvoiceUrl,
      @JsonKey(name: 'issue_date') final DateTime? issueDate,
      @JsonKey(name: 'due_date') final DateTime? dueDate,
      @JsonKey(name: 'description') final String description,
      @JsonKey(name: 'purchase_items')
      final List<PurchaseItemModel>? items}) = _$AddPurchasesParamsImpl;

  factory _AddPurchasesParams.fromJson(Map<String, dynamic> json) =
      _$AddPurchasesParamsImpl.fromJson;

  @override
  @JsonKey(name: 'purchase_id')
  String get itemId;
  @override
  @JsonKey(name: 'supplier_name')
  String get supplierName;
  @override
  @JsonKey(name: 'supplier_email')
  String get supplierEmail;
  @override
  @JsonKey(name: 'billing_address')
  String get billingAddress;
  @override
  @JsonKey(name: 'purchase_invoice_url')
  String get purchaseInvoiceUrl;
  @override
  @JsonKey(name: 'issue_date')
  DateTime? get issueDate;
  @override
  @JsonKey(name: 'due_date')
  DateTime? get dueDate;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'purchase_items')
  List<PurchaseItemModel>? get items;
  @override
  @JsonKey(ignore: true)
  _$$AddPurchasesParamsImplCopyWith<_$AddPurchasesParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
