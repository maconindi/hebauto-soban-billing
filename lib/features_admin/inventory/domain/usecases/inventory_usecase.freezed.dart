// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UploadDataParams {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'file')
  List<int>? get file => throw _privateConstructorUsedError;
  @JsonKey(name: 'filename')
  String get filename => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadDataParamsCopyWith<UploadDataParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadDataParamsCopyWith<$Res> {
  factory $UploadDataParamsCopyWith(
          UploadDataParams value, $Res Function(UploadDataParams) then) =
      _$UploadDataParamsCopyWithImpl<$Res, UploadDataParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'file') List<int>? file,
      @JsonKey(name: 'filename') String filename,
      @JsonKey(name: 'category') String category});
}

/// @nodoc
class _$UploadDataParamsCopyWithImpl<$Res, $Val extends UploadDataParams>
    implements $UploadDataParamsCopyWith<$Res> {
  _$UploadDataParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? file = freezed,
    Object? filename = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadDataParamsImplCopyWith<$Res>
    implements $UploadDataParamsCopyWith<$Res> {
  factory _$$UploadDataParamsImplCopyWith(_$UploadDataParamsImpl value,
          $Res Function(_$UploadDataParamsImpl) then) =
      __$$UploadDataParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'file') List<int>? file,
      @JsonKey(name: 'filename') String filename,
      @JsonKey(name: 'category') String category});
}

/// @nodoc
class __$$UploadDataParamsImplCopyWithImpl<$Res>
    extends _$UploadDataParamsCopyWithImpl<$Res, _$UploadDataParamsImpl>
    implements _$$UploadDataParamsImplCopyWith<$Res> {
  __$$UploadDataParamsImplCopyWithImpl(_$UploadDataParamsImpl _value,
      $Res Function(_$UploadDataParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? file = freezed,
    Object? filename = null,
    Object? category = null,
  }) {
    return _then(_$UploadDataParamsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      file: freezed == file
          ? _value._file
          : file // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UploadDataParamsImpl
    with DiagnosticableTreeMixin
    implements _UploadDataParams {
  const _$UploadDataParamsImpl(
      {@JsonKey(name: 'id') this.id = '',
      @JsonKey(name: 'email') this.email = '',
      @JsonKey(name: 'file') final List<int>? file,
      @JsonKey(name: 'filename') this.filename = '',
      @JsonKey(name: 'category') this.category = ''})
      : _file = file;

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'email')
  final String email;
  final List<int>? _file;
  @override
  @JsonKey(name: 'file')
  List<int>? get file {
    final value = _file;
    if (value == null) return null;
    if (_file is EqualUnmodifiableListView) return _file;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'filename')
  final String filename;
  @override
  @JsonKey(name: 'category')
  final String category;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadDataParams(id: $id, email: $email, file: $file, filename: $filename, category: $category)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UploadDataParams'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('file', file))
      ..add(DiagnosticsProperty('filename', filename))
      ..add(DiagnosticsProperty('category', category));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadDataParamsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other._file, _file) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, email,
      const DeepCollectionEquality().hash(_file), filename, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadDataParamsImplCopyWith<_$UploadDataParamsImpl> get copyWith =>
      __$$UploadDataParamsImplCopyWithImpl<_$UploadDataParamsImpl>(
          this, _$identity);
}

abstract class _UploadDataParams implements UploadDataParams {
  const factory _UploadDataParams(
          {@JsonKey(name: 'id') final String id,
          @JsonKey(name: 'email') final String email,
          @JsonKey(name: 'file') final List<int>? file,
          @JsonKey(name: 'filename') final String filename,
          @JsonKey(name: 'category') final String category}) =
      _$UploadDataParamsImpl;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'file')
  List<int>? get file;
  @override
  @JsonKey(name: 'filename')
  String get filename;
  @override
  @JsonKey(name: 'category')
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$UploadDataParamsImplCopyWith<_$UploadDataParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InventoryParams _$InventoryParamsFromJson(Map<String, dynamic> json) {
  return _InventoryParams.fromJson(json);
}

/// @nodoc
mixin _$InventoryParams {
  @JsonKey(name: 'invent_id')
  String get inventId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cus_id')
  String get cusId => throw _privateConstructorUsedError;
  @JsonKey(name: 'cus_email')
  String get cusEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'cus_name')
  String get cusName => throw _privateConstructorUsedError;
  @JsonKey(name: 'cus_company')
  String get cusCompany => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt =>
      throw _privateConstructorUsedError; // Additional fields
  @JsonKey(name: 'vehicle_name')
  String get vehicleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'vin_number')
  String get vinNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'lot_number')
  String get lotNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'year')
  String get yearOfManufacture => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_key')
  bool get isKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InventoryParamsCopyWith<InventoryParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InventoryParamsCopyWith<$Res> {
  factory $InventoryParamsCopyWith(
          InventoryParams value, $Res Function(InventoryParams) then) =
      _$InventoryParamsCopyWithImpl<$Res, InventoryParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invent_id') String inventId,
      @JsonKey(name: 'cus_id') String cusId,
      @JsonKey(name: 'cus_email') String cusEmail,
      @JsonKey(name: 'cus_name') String cusName,
      @JsonKey(name: 'cus_company') String cusCompany,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'vehicle_name') String vehicleName,
      @JsonKey(name: 'vin_number') String vinNumber,
      @JsonKey(name: 'lot_number') String lotNumber,
      @JsonKey(name: 'year') String yearOfManufacture,
      @JsonKey(name: 'color') String color,
      @JsonKey(name: 'is_key') bool isKey});
}

/// @nodoc
class _$InventoryParamsCopyWithImpl<$Res, $Val extends InventoryParams>
    implements $InventoryParamsCopyWith<$Res> {
  _$InventoryParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventId = null,
    Object? cusId = null,
    Object? cusEmail = null,
    Object? cusName = null,
    Object? cusCompany = null,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? vehicleName = null,
    Object? vinNumber = null,
    Object? lotNumber = null,
    Object? yearOfManufacture = null,
    Object? color = null,
    Object? isKey = null,
  }) {
    return _then(_value.copyWith(
      inventId: null == inventId
          ? _value.inventId
          : inventId // ignore: cast_nullable_to_non_nullable
              as String,
      cusId: null == cusId
          ? _value.cusId
          : cusId // ignore: cast_nullable_to_non_nullable
              as String,
      cusEmail: null == cusEmail
          ? _value.cusEmail
          : cusEmail // ignore: cast_nullable_to_non_nullable
              as String,
      cusName: null == cusName
          ? _value.cusName
          : cusName // ignore: cast_nullable_to_non_nullable
              as String,
      cusCompany: null == cusCompany
          ? _value.cusCompany
          : cusCompany // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleName: null == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String,
      vinNumber: null == vinNumber
          ? _value.vinNumber
          : vinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      yearOfManufacture: null == yearOfManufacture
          ? _value.yearOfManufacture
          : yearOfManufacture // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isKey: null == isKey
          ? _value.isKey
          : isKey // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InventoryParamsImplCopyWith<$Res>
    implements $InventoryParamsCopyWith<$Res> {
  factory _$$InventoryParamsImplCopyWith(_$InventoryParamsImpl value,
          $Res Function(_$InventoryParamsImpl) then) =
      __$$InventoryParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invent_id') String inventId,
      @JsonKey(name: 'cus_id') String cusId,
      @JsonKey(name: 'cus_email') String cusEmail,
      @JsonKey(name: 'cus_name') String cusName,
      @JsonKey(name: 'cus_company') String cusCompany,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'vehicle_name') String vehicleName,
      @JsonKey(name: 'vin_number') String vinNumber,
      @JsonKey(name: 'lot_number') String lotNumber,
      @JsonKey(name: 'year') String yearOfManufacture,
      @JsonKey(name: 'color') String color,
      @JsonKey(name: 'is_key') bool isKey});
}

/// @nodoc
class __$$InventoryParamsImplCopyWithImpl<$Res>
    extends _$InventoryParamsCopyWithImpl<$Res, _$InventoryParamsImpl>
    implements _$$InventoryParamsImplCopyWith<$Res> {
  __$$InventoryParamsImplCopyWithImpl(
      _$InventoryParamsImpl _value, $Res Function(_$InventoryParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inventId = null,
    Object? cusId = null,
    Object? cusEmail = null,
    Object? cusName = null,
    Object? cusCompany = null,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? vehicleName = null,
    Object? vinNumber = null,
    Object? lotNumber = null,
    Object? yearOfManufacture = null,
    Object? color = null,
    Object? isKey = null,
  }) {
    return _then(_$InventoryParamsImpl(
      inventId: null == inventId
          ? _value.inventId
          : inventId // ignore: cast_nullable_to_non_nullable
              as String,
      cusId: null == cusId
          ? _value.cusId
          : cusId // ignore: cast_nullable_to_non_nullable
              as String,
      cusEmail: null == cusEmail
          ? _value.cusEmail
          : cusEmail // ignore: cast_nullable_to_non_nullable
              as String,
      cusName: null == cusName
          ? _value.cusName
          : cusName // ignore: cast_nullable_to_non_nullable
              as String,
      cusCompany: null == cusCompany
          ? _value.cusCompany
          : cusCompany // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      vehicleName: null == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String,
      vinNumber: null == vinNumber
          ? _value.vinNumber
          : vinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      yearOfManufacture: null == yearOfManufacture
          ? _value.yearOfManufacture
          : yearOfManufacture // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isKey: null == isKey
          ? _value.isKey
          : isKey // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InventoryParamsImpl
    with DiagnosticableTreeMixin
    implements _InventoryParams {
  const _$InventoryParamsImpl(
      {@JsonKey(name: 'invent_id') this.inventId = '',
      @JsonKey(name: 'cus_id') this.cusId = '',
      @JsonKey(name: 'cus_email') this.cusEmail = '',
      @JsonKey(name: 'cus_name') this.cusName = '',
      @JsonKey(name: 'cus_company') this.cusCompany = '',
      @JsonKey(name: 'updated_at') this.updatedAt = '',
      @JsonKey(name: 'created_at') this.createdAt = '',
      @JsonKey(name: 'vehicle_name') this.vehicleName = '',
      @JsonKey(name: 'vin_number') this.vinNumber = '',
      @JsonKey(name: 'lot_number') this.lotNumber = '',
      @JsonKey(name: 'year') this.yearOfManufacture = '',
      @JsonKey(name: 'color') this.color = '',
      @JsonKey(name: 'is_key') this.isKey = false});

  factory _$InventoryParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InventoryParamsImplFromJson(json);

  @override
  @JsonKey(name: 'invent_id')
  final String inventId;
  @override
  @JsonKey(name: 'cus_id')
  final String cusId;
  @override
  @JsonKey(name: 'cus_email')
  final String cusEmail;
  @override
  @JsonKey(name: 'cus_name')
  final String cusName;
  @override
  @JsonKey(name: 'cus_company')
  final String cusCompany;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
// Additional fields
  @override
  @JsonKey(name: 'vehicle_name')
  final String vehicleName;
  @override
  @JsonKey(name: 'vin_number')
  final String vinNumber;
  @override
  @JsonKey(name: 'lot_number')
  final String lotNumber;
  @override
  @JsonKey(name: 'year')
  final String yearOfManufacture;
  @override
  @JsonKey(name: 'color')
  final String color;
  @override
  @JsonKey(name: 'is_key')
  final bool isKey;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InventoryParams(inventId: $inventId, cusId: $cusId, cusEmail: $cusEmail, cusName: $cusName, cusCompany: $cusCompany, updatedAt: $updatedAt, createdAt: $createdAt, vehicleName: $vehicleName, vinNumber: $vinNumber, lotNumber: $lotNumber, yearOfManufacture: $yearOfManufacture, color: $color, isKey: $isKey)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InventoryParams'))
      ..add(DiagnosticsProperty('inventId', inventId))
      ..add(DiagnosticsProperty('cusId', cusId))
      ..add(DiagnosticsProperty('cusEmail', cusEmail))
      ..add(DiagnosticsProperty('cusName', cusName))
      ..add(DiagnosticsProperty('cusCompany', cusCompany))
      ..add(DiagnosticsProperty('updatedAt', updatedAt))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('vehicleName', vehicleName))
      ..add(DiagnosticsProperty('vinNumber', vinNumber))
      ..add(DiagnosticsProperty('lotNumber', lotNumber))
      ..add(DiagnosticsProperty('yearOfManufacture', yearOfManufacture))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('isKey', isKey));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InventoryParamsImpl &&
            (identical(other.inventId, inventId) ||
                other.inventId == inventId) &&
            (identical(other.cusId, cusId) || other.cusId == cusId) &&
            (identical(other.cusEmail, cusEmail) ||
                other.cusEmail == cusEmail) &&
            (identical(other.cusName, cusName) || other.cusName == cusName) &&
            (identical(other.cusCompany, cusCompany) ||
                other.cusCompany == cusCompany) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.vehicleName, vehicleName) ||
                other.vehicleName == vehicleName) &&
            (identical(other.vinNumber, vinNumber) ||
                other.vinNumber == vinNumber) &&
            (identical(other.lotNumber, lotNumber) ||
                other.lotNumber == lotNumber) &&
            (identical(other.yearOfManufacture, yearOfManufacture) ||
                other.yearOfManufacture == yearOfManufacture) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isKey, isKey) || other.isKey == isKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      inventId,
      cusId,
      cusEmail,
      cusName,
      cusCompany,
      updatedAt,
      createdAt,
      vehicleName,
      vinNumber,
      lotNumber,
      yearOfManufacture,
      color,
      isKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InventoryParamsImplCopyWith<_$InventoryParamsImpl> get copyWith =>
      __$$InventoryParamsImplCopyWithImpl<_$InventoryParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InventoryParamsImplToJson(
      this,
    );
  }
}

abstract class _InventoryParams implements InventoryParams {
  const factory _InventoryParams(
      {@JsonKey(name: 'invent_id') final String inventId,
      @JsonKey(name: 'cus_id') final String cusId,
      @JsonKey(name: 'cus_email') final String cusEmail,
      @JsonKey(name: 'cus_name') final String cusName,
      @JsonKey(name: 'cus_company') final String cusCompany,
      @JsonKey(name: 'updated_at') final String updatedAt,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(name: 'vehicle_name') final String vehicleName,
      @JsonKey(name: 'vin_number') final String vinNumber,
      @JsonKey(name: 'lot_number') final String lotNumber,
      @JsonKey(name: 'year') final String yearOfManufacture,
      @JsonKey(name: 'color') final String color,
      @JsonKey(name: 'is_key') final bool isKey}) = _$InventoryParamsImpl;

  factory _InventoryParams.fromJson(Map<String, dynamic> json) =
      _$InventoryParamsImpl.fromJson;

  @override
  @JsonKey(name: 'invent_id')
  String get inventId;
  @override
  @JsonKey(name: 'cus_id')
  String get cusId;
  @override
  @JsonKey(name: 'cus_email')
  String get cusEmail;
  @override
  @JsonKey(name: 'cus_name')
  String get cusName;
  @override
  @JsonKey(name: 'cus_company')
  String get cusCompany;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override // Additional fields
  @JsonKey(name: 'vehicle_name')
  String get vehicleName;
  @override
  @JsonKey(name: 'vin_number')
  String get vinNumber;
  @override
  @JsonKey(name: 'lot_number')
  String get lotNumber;
  @override
  @JsonKey(name: 'year')
  String get yearOfManufacture;
  @override
  @JsonKey(name: 'color')
  String get color;
  @override
  @JsonKey(name: 'is_key')
  bool get isKey;
  @override
  @JsonKey(ignore: true)
  _$$InventoryParamsImplCopyWith<_$InventoryParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VehicleParams _$VehicleParamsFromJson(Map<String, dynamic> json) {
  return _VehicleParams.fromJson(json);
}

/// @nodoc
mixin _$VehicleParams {
  @JsonKey(name: 'vehicle_name')
  String get vehicleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'vin_number')
  String get vinNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'lot_number')
  String get lotNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'year')
  String get yearOfManufacture => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_key')
  bool get isKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VehicleParamsCopyWith<VehicleParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleParamsCopyWith<$Res> {
  factory $VehicleParamsCopyWith(
          VehicleParams value, $Res Function(VehicleParams) then) =
      _$VehicleParamsCopyWithImpl<$Res, VehicleParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'vehicle_name') String vehicleName,
      @JsonKey(name: 'vin_number') String vinNumber,
      @JsonKey(name: 'lot_number') String lotNumber,
      @JsonKey(name: 'year') String yearOfManufacture,
      @JsonKey(name: 'color') String color,
      @JsonKey(name: 'is_key') bool isKey});
}

/// @nodoc
class _$VehicleParamsCopyWithImpl<$Res, $Val extends VehicleParams>
    implements $VehicleParamsCopyWith<$Res> {
  _$VehicleParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleName = null,
    Object? vinNumber = null,
    Object? lotNumber = null,
    Object? yearOfManufacture = null,
    Object? color = null,
    Object? isKey = null,
  }) {
    return _then(_value.copyWith(
      vehicleName: null == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String,
      vinNumber: null == vinNumber
          ? _value.vinNumber
          : vinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      yearOfManufacture: null == yearOfManufacture
          ? _value.yearOfManufacture
          : yearOfManufacture // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isKey: null == isKey
          ? _value.isKey
          : isKey // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleParamsImplCopyWith<$Res>
    implements $VehicleParamsCopyWith<$Res> {
  factory _$$VehicleParamsImplCopyWith(
          _$VehicleParamsImpl value, $Res Function(_$VehicleParamsImpl) then) =
      __$$VehicleParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'vehicle_name') String vehicleName,
      @JsonKey(name: 'vin_number') String vinNumber,
      @JsonKey(name: 'lot_number') String lotNumber,
      @JsonKey(name: 'year') String yearOfManufacture,
      @JsonKey(name: 'color') String color,
      @JsonKey(name: 'is_key') bool isKey});
}

/// @nodoc
class __$$VehicleParamsImplCopyWithImpl<$Res>
    extends _$VehicleParamsCopyWithImpl<$Res, _$VehicleParamsImpl>
    implements _$$VehicleParamsImplCopyWith<$Res> {
  __$$VehicleParamsImplCopyWithImpl(
      _$VehicleParamsImpl _value, $Res Function(_$VehicleParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleName = null,
    Object? vinNumber = null,
    Object? lotNumber = null,
    Object? yearOfManufacture = null,
    Object? color = null,
    Object? isKey = null,
  }) {
    return _then(_$VehicleParamsImpl(
      vehicleName: null == vehicleName
          ? _value.vehicleName
          : vehicleName // ignore: cast_nullable_to_non_nullable
              as String,
      vinNumber: null == vinNumber
          ? _value.vinNumber
          : vinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
      yearOfManufacture: null == yearOfManufacture
          ? _value.yearOfManufacture
          : yearOfManufacture // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      isKey: null == isKey
          ? _value.isKey
          : isKey // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleParamsImpl
    with DiagnosticableTreeMixin
    implements _VehicleParams {
  const _$VehicleParamsImpl(
      {@JsonKey(name: 'vehicle_name') this.vehicleName = '',
      @JsonKey(name: 'vin_number') this.vinNumber = '',
      @JsonKey(name: 'lot_number') this.lotNumber = '',
      @JsonKey(name: 'year') this.yearOfManufacture = '',
      @JsonKey(name: 'color') this.color = '',
      @JsonKey(name: 'is_key') this.isKey = false});

  factory _$VehicleParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleParamsImplFromJson(json);

  @override
  @JsonKey(name: 'vehicle_name')
  final String vehicleName;
  @override
  @JsonKey(name: 'vin_number')
  final String vinNumber;
  @override
  @JsonKey(name: 'lot_number')
  final String lotNumber;
  @override
  @JsonKey(name: 'year')
  final String yearOfManufacture;
  @override
  @JsonKey(name: 'color')
  final String color;
  @override
  @JsonKey(name: 'is_key')
  final bool isKey;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VehicleParams(vehicleName: $vehicleName, vinNumber: $vinNumber, lotNumber: $lotNumber, yearOfManufacture: $yearOfManufacture, color: $color, isKey: $isKey)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VehicleParams'))
      ..add(DiagnosticsProperty('vehicleName', vehicleName))
      ..add(DiagnosticsProperty('vinNumber', vinNumber))
      ..add(DiagnosticsProperty('lotNumber', lotNumber))
      ..add(DiagnosticsProperty('yearOfManufacture', yearOfManufacture))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('isKey', isKey));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleParamsImpl &&
            (identical(other.vehicleName, vehicleName) ||
                other.vehicleName == vehicleName) &&
            (identical(other.vinNumber, vinNumber) ||
                other.vinNumber == vinNumber) &&
            (identical(other.lotNumber, lotNumber) ||
                other.lotNumber == lotNumber) &&
            (identical(other.yearOfManufacture, yearOfManufacture) ||
                other.yearOfManufacture == yearOfManufacture) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isKey, isKey) || other.isKey == isKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, vehicleName, vinNumber,
      lotNumber, yearOfManufacture, color, isKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleParamsImplCopyWith<_$VehicleParamsImpl> get copyWith =>
      __$$VehicleParamsImplCopyWithImpl<_$VehicleParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleParamsImplToJson(
      this,
    );
  }
}

abstract class _VehicleParams implements VehicleParams {
  const factory _VehicleParams(
      {@JsonKey(name: 'vehicle_name') final String vehicleName,
      @JsonKey(name: 'vin_number') final String vinNumber,
      @JsonKey(name: 'lot_number') final String lotNumber,
      @JsonKey(name: 'year') final String yearOfManufacture,
      @JsonKey(name: 'color') final String color,
      @JsonKey(name: 'is_key') final bool isKey}) = _$VehicleParamsImpl;

  factory _VehicleParams.fromJson(Map<String, dynamic> json) =
      _$VehicleParamsImpl.fromJson;

  @override
  @JsonKey(name: 'vehicle_name')
  String get vehicleName;
  @override
  @JsonKey(name: 'vin_number')
  String get vinNumber;
  @override
  @JsonKey(name: 'lot_number')
  String get lotNumber;
  @override
  @JsonKey(name: 'year')
  String get yearOfManufacture;
  @override
  @JsonKey(name: 'color')
  String get color;
  @override
  @JsonKey(name: 'is_key')
  bool get isKey;
  @override
  @JsonKey(ignore: true)
  _$$VehicleParamsImplCopyWith<_$VehicleParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceParams _$InvoiceParamsFromJson(Map<String, dynamic> json) {
  return _InvoiceParams.fromJson(json);
}

/// @nodoc
mixin _$InvoiceParams {
  @JsonKey(name: 'invoice_no')
  dynamic get invoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_date')
  DateTime? get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_amount_cad')
  String get invoiceAmountCad => throw _privateConstructorUsedError;
  @JsonKey(name: 'hst_amount_cad')
  String get hstAmountCad => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_amount_aed')
  String get invoiceAmountAed => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount_aed')
  String get totalAmountAed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvoiceParamsCopyWith<InvoiceParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceParamsCopyWith<$Res> {
  factory $InvoiceParamsCopyWith(
          InvoiceParams value, $Res Function(InvoiceParams) then) =
      _$InvoiceParamsCopyWithImpl<$Res, InvoiceParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invoice_no') dynamic invoiceNumber,
      @JsonKey(name: 'invoice_date') DateTime? invoiceDate,
      @JsonKey(name: 'invoice_amount_cad') String invoiceAmountCad,
      @JsonKey(name: 'hst_amount_cad') String hstAmountCad,
      @JsonKey(name: 'invoice_amount_aed') String invoiceAmountAed,
      @JsonKey(name: 'total_amount_aed') String totalAmountAed});
}

/// @nodoc
class _$InvoiceParamsCopyWithImpl<$Res, $Val extends InvoiceParams>
    implements $InvoiceParamsCopyWith<$Res> {
  _$InvoiceParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = freezed,
    Object? invoiceDate = freezed,
    Object? invoiceAmountCad = null,
    Object? hstAmountCad = null,
    Object? invoiceAmountAed = null,
    Object? totalAmountAed = null,
  }) {
    return _then(_value.copyWith(
      invoiceNumber: freezed == invoiceNumber
          ? _value.invoiceNumber
          : invoiceNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      invoiceDate: freezed == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invoiceAmountCad: null == invoiceAmountCad
          ? _value.invoiceAmountCad
          : invoiceAmountCad // ignore: cast_nullable_to_non_nullable
              as String,
      hstAmountCad: null == hstAmountCad
          ? _value.hstAmountCad
          : hstAmountCad // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceAmountAed: null == invoiceAmountAed
          ? _value.invoiceAmountAed
          : invoiceAmountAed // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmountAed: null == totalAmountAed
          ? _value.totalAmountAed
          : totalAmountAed // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceParamsImplCopyWith<$Res>
    implements $InvoiceParamsCopyWith<$Res> {
  factory _$$InvoiceParamsImplCopyWith(
          _$InvoiceParamsImpl value, $Res Function(_$InvoiceParamsImpl) then) =
      __$$InvoiceParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invoice_no') dynamic invoiceNumber,
      @JsonKey(name: 'invoice_date') DateTime? invoiceDate,
      @JsonKey(name: 'invoice_amount_cad') String invoiceAmountCad,
      @JsonKey(name: 'hst_amount_cad') String hstAmountCad,
      @JsonKey(name: 'invoice_amount_aed') String invoiceAmountAed,
      @JsonKey(name: 'total_amount_aed') String totalAmountAed});
}

/// @nodoc
class __$$InvoiceParamsImplCopyWithImpl<$Res>
    extends _$InvoiceParamsCopyWithImpl<$Res, _$InvoiceParamsImpl>
    implements _$$InvoiceParamsImplCopyWith<$Res> {
  __$$InvoiceParamsImplCopyWithImpl(
      _$InvoiceParamsImpl _value, $Res Function(_$InvoiceParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNumber = freezed,
    Object? invoiceDate = freezed,
    Object? invoiceAmountCad = null,
    Object? hstAmountCad = null,
    Object? invoiceAmountAed = null,
    Object? totalAmountAed = null,
  }) {
    return _then(_$InvoiceParamsImpl(
      invoiceNumber:
          freezed == invoiceNumber ? _value.invoiceNumber! : invoiceNumber,
      invoiceDate: freezed == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invoiceAmountCad: null == invoiceAmountCad
          ? _value.invoiceAmountCad
          : invoiceAmountCad // ignore: cast_nullable_to_non_nullable
              as String,
      hstAmountCad: null == hstAmountCad
          ? _value.hstAmountCad
          : hstAmountCad // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceAmountAed: null == invoiceAmountAed
          ? _value.invoiceAmountAed
          : invoiceAmountAed // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmountAed: null == totalAmountAed
          ? _value.totalAmountAed
          : totalAmountAed // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceParamsImpl
    with DiagnosticableTreeMixin
    implements _InvoiceParams {
  const _$InvoiceParamsImpl(
      {@JsonKey(name: 'invoice_no') this.invoiceNumber = 'N/A',
      @JsonKey(name: 'invoice_date') this.invoiceDate,
      @JsonKey(name: 'invoice_amount_cad') this.invoiceAmountCad = 'N/A',
      @JsonKey(name: 'hst_amount_cad') this.hstAmountCad = 'N/A',
      @JsonKey(name: 'invoice_amount_aed') this.invoiceAmountAed = 'N/A',
      @JsonKey(name: 'total_amount_aed') this.totalAmountAed = 'N/A'});

  factory _$InvoiceParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceParamsImplFromJson(json);

  @override
  @JsonKey(name: 'invoice_no')
  final dynamic invoiceNumber;
  @override
  @JsonKey(name: 'invoice_date')
  final DateTime? invoiceDate;
  @override
  @JsonKey(name: 'invoice_amount_cad')
  final String invoiceAmountCad;
  @override
  @JsonKey(name: 'hst_amount_cad')
  final String hstAmountCad;
  @override
  @JsonKey(name: 'invoice_amount_aed')
  final String invoiceAmountAed;
  @override
  @JsonKey(name: 'total_amount_aed')
  final String totalAmountAed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'InvoiceParams(invoiceNumber: $invoiceNumber, invoiceDate: $invoiceDate, invoiceAmountCad: $invoiceAmountCad, hstAmountCad: $hstAmountCad, invoiceAmountAed: $invoiceAmountAed, totalAmountAed: $totalAmountAed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'InvoiceParams'))
      ..add(DiagnosticsProperty('invoiceNumber', invoiceNumber))
      ..add(DiagnosticsProperty('invoiceDate', invoiceDate))
      ..add(DiagnosticsProperty('invoiceAmountCad', invoiceAmountCad))
      ..add(DiagnosticsProperty('hstAmountCad', hstAmountCad))
      ..add(DiagnosticsProperty('invoiceAmountAed', invoiceAmountAed))
      ..add(DiagnosticsProperty('totalAmountAed', totalAmountAed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceParamsImpl &&
            const DeepCollectionEquality()
                .equals(other.invoiceNumber, invoiceNumber) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.invoiceAmountCad, invoiceAmountCad) ||
                other.invoiceAmountCad == invoiceAmountCad) &&
            (identical(other.hstAmountCad, hstAmountCad) ||
                other.hstAmountCad == hstAmountCad) &&
            (identical(other.invoiceAmountAed, invoiceAmountAed) ||
                other.invoiceAmountAed == invoiceAmountAed) &&
            (identical(other.totalAmountAed, totalAmountAed) ||
                other.totalAmountAed == totalAmountAed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(invoiceNumber),
      invoiceDate,
      invoiceAmountCad,
      hstAmountCad,
      invoiceAmountAed,
      totalAmountAed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceParamsImplCopyWith<_$InvoiceParamsImpl> get copyWith =>
      __$$InvoiceParamsImplCopyWithImpl<_$InvoiceParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceParamsImplToJson(
      this,
    );
  }
}

abstract class _InvoiceParams implements InvoiceParams {
  const factory _InvoiceParams(
          {@JsonKey(name: 'invoice_no') final dynamic invoiceNumber,
          @JsonKey(name: 'invoice_date') final DateTime? invoiceDate,
          @JsonKey(name: 'invoice_amount_cad') final String invoiceAmountCad,
          @JsonKey(name: 'hst_amount_cad') final String hstAmountCad,
          @JsonKey(name: 'invoice_amount_aed') final String invoiceAmountAed,
          @JsonKey(name: 'total_amount_aed') final String totalAmountAed}) =
      _$InvoiceParamsImpl;

  factory _InvoiceParams.fromJson(Map<String, dynamic> json) =
      _$InvoiceParamsImpl.fromJson;

  @override
  @JsonKey(name: 'invoice_no')
  dynamic get invoiceNumber;
  @override
  @JsonKey(name: 'invoice_date')
  DateTime? get invoiceDate;
  @override
  @JsonKey(name: 'invoice_amount_cad')
  String get invoiceAmountCad;
  @override
  @JsonKey(name: 'hst_amount_cad')
  String get hstAmountCad;
  @override
  @JsonKey(name: 'invoice_amount_aed')
  String get invoiceAmountAed;
  @override
  @JsonKey(name: 'total_amount_aed')
  String get totalAmountAed;
  @override
  @JsonKey(ignore: true)
  _$$InvoiceParamsImplCopyWith<_$InvoiceParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TowingParams _$TowingParamsFromJson(Map<String, dynamic> json) {
  return _TowingParams.fromJson(json);
}

/// @nodoc
mixin _$TowingParams {
  @JsonKey(name: 'departure_port')
  String get departurePort => throw _privateConstructorUsedError;
  @JsonKey(name: 'towing_city')
  String get towingCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'towing_date')
  DateTime? get towingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'warehouse_delivery_date')
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'towing_cost_aed')
  String get towingCostAed => throw _privateConstructorUsedError;
  @JsonKey(name: 'towing_cost_cad')
  String get towingCostCad => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TowingParamsCopyWith<TowingParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TowingParamsCopyWith<$Res> {
  factory $TowingParamsCopyWith(
          TowingParams value, $Res Function(TowingParams) then) =
      _$TowingParamsCopyWithImpl<$Res, TowingParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'departure_port') String departurePort,
      @JsonKey(name: 'towing_city') String towingCity,
      @JsonKey(name: 'towing_date') DateTime? towingDate,
      @JsonKey(name: 'warehouse_delivery_date') DateTime? deliveryDate,
      @JsonKey(name: 'towing_cost_aed') String towingCostAed,
      @JsonKey(name: 'towing_cost_cad') String towingCostCad});
}

/// @nodoc
class _$TowingParamsCopyWithImpl<$Res, $Val extends TowingParams>
    implements $TowingParamsCopyWith<$Res> {
  _$TowingParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departurePort = null,
    Object? towingCity = null,
    Object? towingDate = freezed,
    Object? deliveryDate = freezed,
    Object? towingCostAed = null,
    Object? towingCostCad = null,
  }) {
    return _then(_value.copyWith(
      departurePort: null == departurePort
          ? _value.departurePort
          : departurePort // ignore: cast_nullable_to_non_nullable
              as String,
      towingCity: null == towingCity
          ? _value.towingCity
          : towingCity // ignore: cast_nullable_to_non_nullable
              as String,
      towingDate: freezed == towingDate
          ? _value.towingDate
          : towingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      towingCostAed: null == towingCostAed
          ? _value.towingCostAed
          : towingCostAed // ignore: cast_nullable_to_non_nullable
              as String,
      towingCostCad: null == towingCostCad
          ? _value.towingCostCad
          : towingCostCad // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TowingParamsImplCopyWith<$Res>
    implements $TowingParamsCopyWith<$Res> {
  factory _$$TowingParamsImplCopyWith(
          _$TowingParamsImpl value, $Res Function(_$TowingParamsImpl) then) =
      __$$TowingParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'departure_port') String departurePort,
      @JsonKey(name: 'towing_city') String towingCity,
      @JsonKey(name: 'towing_date') DateTime? towingDate,
      @JsonKey(name: 'warehouse_delivery_date') DateTime? deliveryDate,
      @JsonKey(name: 'towing_cost_aed') String towingCostAed,
      @JsonKey(name: 'towing_cost_cad') String towingCostCad});
}

/// @nodoc
class __$$TowingParamsImplCopyWithImpl<$Res>
    extends _$TowingParamsCopyWithImpl<$Res, _$TowingParamsImpl>
    implements _$$TowingParamsImplCopyWith<$Res> {
  __$$TowingParamsImplCopyWithImpl(
      _$TowingParamsImpl _value, $Res Function(_$TowingParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departurePort = null,
    Object? towingCity = null,
    Object? towingDate = freezed,
    Object? deliveryDate = freezed,
    Object? towingCostAed = null,
    Object? towingCostCad = null,
  }) {
    return _then(_$TowingParamsImpl(
      departurePort: null == departurePort
          ? _value.departurePort
          : departurePort // ignore: cast_nullable_to_non_nullable
              as String,
      towingCity: null == towingCity
          ? _value.towingCity
          : towingCity // ignore: cast_nullable_to_non_nullable
              as String,
      towingDate: freezed == towingDate
          ? _value.towingDate
          : towingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      towingCostAed: null == towingCostAed
          ? _value.towingCostAed
          : towingCostAed // ignore: cast_nullable_to_non_nullable
              as String,
      towingCostCad: null == towingCostCad
          ? _value.towingCostCad
          : towingCostCad // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TowingParamsImpl with DiagnosticableTreeMixin implements _TowingParams {
  const _$TowingParamsImpl(
      {@JsonKey(name: 'departure_port') this.departurePort = '',
      @JsonKey(name: 'towing_city') this.towingCity = '',
      @JsonKey(name: 'towing_date') this.towingDate,
      @JsonKey(name: 'warehouse_delivery_date') this.deliveryDate,
      @JsonKey(name: 'towing_cost_aed') this.towingCostAed = '',
      @JsonKey(name: 'towing_cost_cad') this.towingCostCad = ''});

  factory _$TowingParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TowingParamsImplFromJson(json);

  @override
  @JsonKey(name: 'departure_port')
  final String departurePort;
  @override
  @JsonKey(name: 'towing_city')
  final String towingCity;
  @override
  @JsonKey(name: 'towing_date')
  final DateTime? towingDate;
  @override
  @JsonKey(name: 'warehouse_delivery_date')
  final DateTime? deliveryDate;
  @override
  @JsonKey(name: 'towing_cost_aed')
  final String towingCostAed;
  @override
  @JsonKey(name: 'towing_cost_cad')
  final String towingCostCad;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TowingParams(departurePort: $departurePort, towingCity: $towingCity, towingDate: $towingDate, deliveryDate: $deliveryDate, towingCostAed: $towingCostAed, towingCostCad: $towingCostCad)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TowingParams'))
      ..add(DiagnosticsProperty('departurePort', departurePort))
      ..add(DiagnosticsProperty('towingCity', towingCity))
      ..add(DiagnosticsProperty('towingDate', towingDate))
      ..add(DiagnosticsProperty('deliveryDate', deliveryDate))
      ..add(DiagnosticsProperty('towingCostAed', towingCostAed))
      ..add(DiagnosticsProperty('towingCostCad', towingCostCad));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TowingParamsImpl &&
            (identical(other.departurePort, departurePort) ||
                other.departurePort == departurePort) &&
            (identical(other.towingCity, towingCity) ||
                other.towingCity == towingCity) &&
            (identical(other.towingDate, towingDate) ||
                other.towingDate == towingDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.towingCostAed, towingCostAed) ||
                other.towingCostAed == towingCostAed) &&
            (identical(other.towingCostCad, towingCostCad) ||
                other.towingCostCad == towingCostCad));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, departurePort, towingCity,
      towingDate, deliveryDate, towingCostAed, towingCostCad);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TowingParamsImplCopyWith<_$TowingParamsImpl> get copyWith =>
      __$$TowingParamsImplCopyWithImpl<_$TowingParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TowingParamsImplToJson(
      this,
    );
  }
}

abstract class _TowingParams implements TowingParams {
  const factory _TowingParams(
      {@JsonKey(name: 'departure_port') final String departurePort,
      @JsonKey(name: 'towing_city') final String towingCity,
      @JsonKey(name: 'towing_date') final DateTime? towingDate,
      @JsonKey(name: 'warehouse_delivery_date') final DateTime? deliveryDate,
      @JsonKey(name: 'towing_cost_aed') final String towingCostAed,
      @JsonKey(name: 'towing_cost_cad')
      final String towingCostCad}) = _$TowingParamsImpl;

  factory _TowingParams.fromJson(Map<String, dynamic> json) =
      _$TowingParamsImpl.fromJson;

  @override
  @JsonKey(name: 'departure_port')
  String get departurePort;
  @override
  @JsonKey(name: 'towing_city')
  String get towingCity;
  @override
  @JsonKey(name: 'towing_date')
  DateTime? get towingDate;
  @override
  @JsonKey(name: 'warehouse_delivery_date')
  DateTime? get deliveryDate;
  @override
  @JsonKey(name: 'towing_cost_aed')
  String get towingCostAed;
  @override
  @JsonKey(name: 'towing_cost_cad')
  String get towingCostCad;
  @override
  @JsonKey(ignore: true)
  _$$TowingParamsImplCopyWith<_$TowingParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ShippingParams _$ShippingParamsFromJson(Map<String, dynamic> json) {
  return _ShippingParams.fromJson(json);
}

/// @nodoc
mixin _$ShippingParams {
  @JsonKey(name: 'container_no')
  String get containerNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'booking_no')
  String get bookingNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_date')
  DateTime? get shippingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'exp_arrival_date')
  DateTime? get expArrivalDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_cost_aed')
  String get shippingCostAed => throw _privateConstructorUsedError;
  @JsonKey(name: 'shipping_cost_cad')
  String get shippingCostCad => throw _privateConstructorUsedError;
  @JsonKey(name: 'off_loading_port')
  String get offLoadingPort => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShippingParamsCopyWith<ShippingParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShippingParamsCopyWith<$Res> {
  factory $ShippingParamsCopyWith(
          ShippingParams value, $Res Function(ShippingParams) then) =
      _$ShippingParamsCopyWithImpl<$Res, ShippingParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'container_no') String containerNumber,
      @JsonKey(name: 'booking_no') String bookingNumber,
      @JsonKey(name: 'shipping_date') DateTime? shippingDate,
      @JsonKey(name: 'exp_arrival_date') DateTime? expArrivalDate,
      @JsonKey(name: 'shipping_cost_aed') String shippingCostAed,
      @JsonKey(name: 'shipping_cost_cad') String shippingCostCad,
      @JsonKey(name: 'off_loading_port') String offLoadingPort});
}

/// @nodoc
class _$ShippingParamsCopyWithImpl<$Res, $Val extends ShippingParams>
    implements $ShippingParamsCopyWith<$Res> {
  _$ShippingParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? containerNumber = null,
    Object? bookingNumber = null,
    Object? shippingDate = freezed,
    Object? expArrivalDate = freezed,
    Object? shippingCostAed = null,
    Object? shippingCostCad = null,
    Object? offLoadingPort = null,
  }) {
    return _then(_value.copyWith(
      containerNumber: null == containerNumber
          ? _value.containerNumber
          : containerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bookingNumber: null == bookingNumber
          ? _value.bookingNumber
          : bookingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      shippingDate: freezed == shippingDate
          ? _value.shippingDate
          : shippingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expArrivalDate: freezed == expArrivalDate
          ? _value.expArrivalDate
          : expArrivalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippingCostAed: null == shippingCostAed
          ? _value.shippingCostAed
          : shippingCostAed // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCostCad: null == shippingCostCad
          ? _value.shippingCostCad
          : shippingCostCad // ignore: cast_nullable_to_non_nullable
              as String,
      offLoadingPort: null == offLoadingPort
          ? _value.offLoadingPort
          : offLoadingPort // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShippingParamsImplCopyWith<$Res>
    implements $ShippingParamsCopyWith<$Res> {
  factory _$$ShippingParamsImplCopyWith(_$ShippingParamsImpl value,
          $Res Function(_$ShippingParamsImpl) then) =
      __$$ShippingParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'container_no') String containerNumber,
      @JsonKey(name: 'booking_no') String bookingNumber,
      @JsonKey(name: 'shipping_date') DateTime? shippingDate,
      @JsonKey(name: 'exp_arrival_date') DateTime? expArrivalDate,
      @JsonKey(name: 'shipping_cost_aed') String shippingCostAed,
      @JsonKey(name: 'shipping_cost_cad') String shippingCostCad,
      @JsonKey(name: 'off_loading_port') String offLoadingPort});
}

/// @nodoc
class __$$ShippingParamsImplCopyWithImpl<$Res>
    extends _$ShippingParamsCopyWithImpl<$Res, _$ShippingParamsImpl>
    implements _$$ShippingParamsImplCopyWith<$Res> {
  __$$ShippingParamsImplCopyWithImpl(
      _$ShippingParamsImpl _value, $Res Function(_$ShippingParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? containerNumber = null,
    Object? bookingNumber = null,
    Object? shippingDate = freezed,
    Object? expArrivalDate = freezed,
    Object? shippingCostAed = null,
    Object? shippingCostCad = null,
    Object? offLoadingPort = null,
  }) {
    return _then(_$ShippingParamsImpl(
      containerNumber: null == containerNumber
          ? _value.containerNumber
          : containerNumber // ignore: cast_nullable_to_non_nullable
              as String,
      bookingNumber: null == bookingNumber
          ? _value.bookingNumber
          : bookingNumber // ignore: cast_nullable_to_non_nullable
              as String,
      shippingDate: freezed == shippingDate
          ? _value.shippingDate
          : shippingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expArrivalDate: freezed == expArrivalDate
          ? _value.expArrivalDate
          : expArrivalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shippingCostAed: null == shippingCostAed
          ? _value.shippingCostAed
          : shippingCostAed // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCostCad: null == shippingCostCad
          ? _value.shippingCostCad
          : shippingCostCad // ignore: cast_nullable_to_non_nullable
              as String,
      offLoadingPort: null == offLoadingPort
          ? _value.offLoadingPort
          : offLoadingPort // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ShippingParamsImpl
    with DiagnosticableTreeMixin
    implements _ShippingParams {
  const _$ShippingParamsImpl(
      {@JsonKey(name: 'container_no') this.containerNumber = '',
      @JsonKey(name: 'booking_no') this.bookingNumber = '',
      @JsonKey(name: 'shipping_date') this.shippingDate,
      @JsonKey(name: 'exp_arrival_date') this.expArrivalDate,
      @JsonKey(name: 'shipping_cost_aed') this.shippingCostAed = '',
      @JsonKey(name: 'shipping_cost_cad') this.shippingCostCad = '',
      @JsonKey(name: 'off_loading_port') this.offLoadingPort = ''});

  factory _$ShippingParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShippingParamsImplFromJson(json);

  @override
  @JsonKey(name: 'container_no')
  final String containerNumber;
  @override
  @JsonKey(name: 'booking_no')
  final String bookingNumber;
  @override
  @JsonKey(name: 'shipping_date')
  final DateTime? shippingDate;
  @override
  @JsonKey(name: 'exp_arrival_date')
  final DateTime? expArrivalDate;
  @override
  @JsonKey(name: 'shipping_cost_aed')
  final String shippingCostAed;
  @override
  @JsonKey(name: 'shipping_cost_cad')
  final String shippingCostCad;
  @override
  @JsonKey(name: 'off_loading_port')
  final String offLoadingPort;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShippingParams(containerNumber: $containerNumber, bookingNumber: $bookingNumber, shippingDate: $shippingDate, expArrivalDate: $expArrivalDate, shippingCostAed: $shippingCostAed, shippingCostCad: $shippingCostCad, offLoadingPort: $offLoadingPort)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShippingParams'))
      ..add(DiagnosticsProperty('containerNumber', containerNumber))
      ..add(DiagnosticsProperty('bookingNumber', bookingNumber))
      ..add(DiagnosticsProperty('shippingDate', shippingDate))
      ..add(DiagnosticsProperty('expArrivalDate', expArrivalDate))
      ..add(DiagnosticsProperty('shippingCostAed', shippingCostAed))
      ..add(DiagnosticsProperty('shippingCostCad', shippingCostCad))
      ..add(DiagnosticsProperty('offLoadingPort', offLoadingPort));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShippingParamsImpl &&
            (identical(other.containerNumber, containerNumber) ||
                other.containerNumber == containerNumber) &&
            (identical(other.bookingNumber, bookingNumber) ||
                other.bookingNumber == bookingNumber) &&
            (identical(other.shippingDate, shippingDate) ||
                other.shippingDate == shippingDate) &&
            (identical(other.expArrivalDate, expArrivalDate) ||
                other.expArrivalDate == expArrivalDate) &&
            (identical(other.shippingCostAed, shippingCostAed) ||
                other.shippingCostAed == shippingCostAed) &&
            (identical(other.shippingCostCad, shippingCostCad) ||
                other.shippingCostCad == shippingCostCad) &&
            (identical(other.offLoadingPort, offLoadingPort) ||
                other.offLoadingPort == offLoadingPort));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      containerNumber,
      bookingNumber,
      shippingDate,
      expArrivalDate,
      shippingCostAed,
      shippingCostCad,
      offLoadingPort);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShippingParamsImplCopyWith<_$ShippingParamsImpl> get copyWith =>
      __$$ShippingParamsImplCopyWithImpl<_$ShippingParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ShippingParamsImplToJson(
      this,
    );
  }
}

abstract class _ShippingParams implements ShippingParams {
  const factory _ShippingParams(
          {@JsonKey(name: 'container_no') final String containerNumber,
          @JsonKey(name: 'booking_no') final String bookingNumber,
          @JsonKey(name: 'shipping_date') final DateTime? shippingDate,
          @JsonKey(name: 'exp_arrival_date') final DateTime? expArrivalDate,
          @JsonKey(name: 'shipping_cost_aed') final String shippingCostAed,
          @JsonKey(name: 'shipping_cost_cad') final String shippingCostCad,
          @JsonKey(name: 'off_loading_port') final String offLoadingPort}) =
      _$ShippingParamsImpl;

  factory _ShippingParams.fromJson(Map<String, dynamic> json) =
      _$ShippingParamsImpl.fromJson;

  @override
  @JsonKey(name: 'container_no')
  String get containerNumber;
  @override
  @JsonKey(name: 'booking_no')
  String get bookingNumber;
  @override
  @JsonKey(name: 'shipping_date')
  DateTime? get shippingDate;
  @override
  @JsonKey(name: 'exp_arrival_date')
  DateTime? get expArrivalDate;
  @override
  @JsonKey(name: 'shipping_cost_aed')
  String get shippingCostAed;
  @override
  @JsonKey(name: 'shipping_cost_cad')
  String get shippingCostCad;
  @override
  @JsonKey(name: 'off_loading_port')
  String get offLoadingPort;
  @override
  @JsonKey(ignore: true)
  _$$ShippingParamsImplCopyWith<_$ShippingParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PortParams _$PortParamsFromJson(Map<String, dynamic> json) {
  return _PortParams.fromJson(json);
}

/// @nodoc
mixin _$PortParams {
  @JsonKey(name: 'arrival_date')
  DateTime? get arrivalDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'clearance_date')
  DateTime? get clearanceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'clearance_amount')
  String get clearanceAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat_amount_aed')
  String get vatAmountAed => throw _privateConstructorUsedError;
  @JsonKey(name: 'port_warehouse_cost')
  String get portWarehouseCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_cost_aed')
  String get customCostAed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortParamsCopyWith<PortParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortParamsCopyWith<$Res> {
  factory $PortParamsCopyWith(
          PortParams value, $Res Function(PortParams) then) =
      _$PortParamsCopyWithImpl<$Res, PortParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'arrival_date') DateTime? arrivalDate,
      @JsonKey(name: 'clearance_date') DateTime? clearanceDate,
      @JsonKey(name: 'clearance_amount') String clearanceAmount,
      @JsonKey(name: 'vat_amount_aed') String vatAmountAed,
      @JsonKey(name: 'port_warehouse_cost') String portWarehouseCost,
      @JsonKey(name: 'custom_cost_aed') String customCostAed});
}

/// @nodoc
class _$PortParamsCopyWithImpl<$Res, $Val extends PortParams>
    implements $PortParamsCopyWith<$Res> {
  _$PortParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arrivalDate = freezed,
    Object? clearanceDate = freezed,
    Object? clearanceAmount = null,
    Object? vatAmountAed = null,
    Object? portWarehouseCost = null,
    Object? customCostAed = null,
  }) {
    return _then(_value.copyWith(
      arrivalDate: freezed == arrivalDate
          ? _value.arrivalDate
          : arrivalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      clearanceDate: freezed == clearanceDate
          ? _value.clearanceDate
          : clearanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      clearanceAmount: null == clearanceAmount
          ? _value.clearanceAmount
          : clearanceAmount // ignore: cast_nullable_to_non_nullable
              as String,
      vatAmountAed: null == vatAmountAed
          ? _value.vatAmountAed
          : vatAmountAed // ignore: cast_nullable_to_non_nullable
              as String,
      portWarehouseCost: null == portWarehouseCost
          ? _value.portWarehouseCost
          : portWarehouseCost // ignore: cast_nullable_to_non_nullable
              as String,
      customCostAed: null == customCostAed
          ? _value.customCostAed
          : customCostAed // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortParamsImplCopyWith<$Res>
    implements $PortParamsCopyWith<$Res> {
  factory _$$PortParamsImplCopyWith(
          _$PortParamsImpl value, $Res Function(_$PortParamsImpl) then) =
      __$$PortParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'arrival_date') DateTime? arrivalDate,
      @JsonKey(name: 'clearance_date') DateTime? clearanceDate,
      @JsonKey(name: 'clearance_amount') String clearanceAmount,
      @JsonKey(name: 'vat_amount_aed') String vatAmountAed,
      @JsonKey(name: 'port_warehouse_cost') String portWarehouseCost,
      @JsonKey(name: 'custom_cost_aed') String customCostAed});
}

/// @nodoc
class __$$PortParamsImplCopyWithImpl<$Res>
    extends _$PortParamsCopyWithImpl<$Res, _$PortParamsImpl>
    implements _$$PortParamsImplCopyWith<$Res> {
  __$$PortParamsImplCopyWithImpl(
      _$PortParamsImpl _value, $Res Function(_$PortParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arrivalDate = freezed,
    Object? clearanceDate = freezed,
    Object? clearanceAmount = null,
    Object? vatAmountAed = null,
    Object? portWarehouseCost = null,
    Object? customCostAed = null,
  }) {
    return _then(_$PortParamsImpl(
      arrivalDate: freezed == arrivalDate
          ? _value.arrivalDate
          : arrivalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      clearanceDate: freezed == clearanceDate
          ? _value.clearanceDate
          : clearanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      clearanceAmount: null == clearanceAmount
          ? _value.clearanceAmount
          : clearanceAmount // ignore: cast_nullable_to_non_nullable
              as String,
      vatAmountAed: null == vatAmountAed
          ? _value.vatAmountAed
          : vatAmountAed // ignore: cast_nullable_to_non_nullable
              as String,
      portWarehouseCost: null == portWarehouseCost
          ? _value.portWarehouseCost
          : portWarehouseCost // ignore: cast_nullable_to_non_nullable
              as String,
      customCostAed: null == customCostAed
          ? _value.customCostAed
          : customCostAed // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PortParamsImpl with DiagnosticableTreeMixin implements _PortParams {
  const _$PortParamsImpl(
      {@JsonKey(name: 'arrival_date') this.arrivalDate,
      @JsonKey(name: 'clearance_date') this.clearanceDate,
      @JsonKey(name: 'clearance_amount') this.clearanceAmount = '',
      @JsonKey(name: 'vat_amount_aed') this.vatAmountAed = '',
      @JsonKey(name: 'port_warehouse_cost') this.portWarehouseCost = '',
      @JsonKey(name: 'custom_cost_aed') this.customCostAed = ''});

  factory _$PortParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PortParamsImplFromJson(json);

  @override
  @JsonKey(name: 'arrival_date')
  final DateTime? arrivalDate;
  @override
  @JsonKey(name: 'clearance_date')
  final DateTime? clearanceDate;
  @override
  @JsonKey(name: 'clearance_amount')
  final String clearanceAmount;
  @override
  @JsonKey(name: 'vat_amount_aed')
  final String vatAmountAed;
  @override
  @JsonKey(name: 'port_warehouse_cost')
  final String portWarehouseCost;
  @override
  @JsonKey(name: 'custom_cost_aed')
  final String customCostAed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PortParams(arrivalDate: $arrivalDate, clearanceDate: $clearanceDate, clearanceAmount: $clearanceAmount, vatAmountAed: $vatAmountAed, portWarehouseCost: $portWarehouseCost, customCostAed: $customCostAed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PortParams'))
      ..add(DiagnosticsProperty('arrivalDate', arrivalDate))
      ..add(DiagnosticsProperty('clearanceDate', clearanceDate))
      ..add(DiagnosticsProperty('clearanceAmount', clearanceAmount))
      ..add(DiagnosticsProperty('vatAmountAed', vatAmountAed))
      ..add(DiagnosticsProperty('portWarehouseCost', portWarehouseCost))
      ..add(DiagnosticsProperty('customCostAed', customCostAed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortParamsImpl &&
            (identical(other.arrivalDate, arrivalDate) ||
                other.arrivalDate == arrivalDate) &&
            (identical(other.clearanceDate, clearanceDate) ||
                other.clearanceDate == clearanceDate) &&
            (identical(other.clearanceAmount, clearanceAmount) ||
                other.clearanceAmount == clearanceAmount) &&
            (identical(other.vatAmountAed, vatAmountAed) ||
                other.vatAmountAed == vatAmountAed) &&
            (identical(other.portWarehouseCost, portWarehouseCost) ||
                other.portWarehouseCost == portWarehouseCost) &&
            (identical(other.customCostAed, customCostAed) ||
                other.customCostAed == customCostAed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, arrivalDate, clearanceDate,
      clearanceAmount, vatAmountAed, portWarehouseCost, customCostAed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortParamsImplCopyWith<_$PortParamsImpl> get copyWith =>
      __$$PortParamsImplCopyWithImpl<_$PortParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PortParamsImplToJson(
      this,
    );
  }
}

abstract class _PortParams implements PortParams {
  const factory _PortParams(
          {@JsonKey(name: 'arrival_date') final DateTime? arrivalDate,
          @JsonKey(name: 'clearance_date') final DateTime? clearanceDate,
          @JsonKey(name: 'clearance_amount') final String clearanceAmount,
          @JsonKey(name: 'vat_amount_aed') final String vatAmountAed,
          @JsonKey(name: 'port_warehouse_cost') final String portWarehouseCost,
          @JsonKey(name: 'custom_cost_aed') final String customCostAed}) =
      _$PortParamsImpl;

  factory _PortParams.fromJson(Map<String, dynamic> json) =
      _$PortParamsImpl.fromJson;

  @override
  @JsonKey(name: 'arrival_date')
  DateTime? get arrivalDate;
  @override
  @JsonKey(name: 'clearance_date')
  DateTime? get clearanceDate;
  @override
  @JsonKey(name: 'clearance_amount')
  String get clearanceAmount;
  @override
  @JsonKey(name: 'vat_amount_aed')
  String get vatAmountAed;
  @override
  @JsonKey(name: 'port_warehouse_cost')
  String get portWarehouseCost;
  @override
  @JsonKey(name: 'custom_cost_aed')
  String get customCostAed;
  @override
  @JsonKey(ignore: true)
  _$$PortParamsImplCopyWith<_$PortParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WarehouseParams _$WarehouseParamsFromJson(Map<String, dynamic> json) {
  return _WarehouseParams.fromJson(json);
}

/// @nodoc
mixin _$WarehouseParams {
  @JsonKey(name: 'warehouse_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'arrival_date')
  DateTime? get arrivalDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage_cost')
  String get storageCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'picking_date')
  DateTime? get pickingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorized_by')
  String get authorizedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'authorized_date')
  DateTime? get authorizedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'picked_by')
  String get pickedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'picked_date')
  DateTime? get pickedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'emirates_id')
  String get emiratesId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WarehouseParamsCopyWith<WarehouseParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WarehouseParamsCopyWith<$Res> {
  factory $WarehouseParamsCopyWith(
          WarehouseParams value, $Res Function(WarehouseParams) then) =
      _$WarehouseParamsCopyWithImpl<$Res, WarehouseParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'warehouse_name') String name,
      @JsonKey(name: 'arrival_date') DateTime? arrivalDate,
      @JsonKey(name: 'storage_cost') String storageCost,
      @JsonKey(name: 'picking_date') DateTime? pickingDate,
      @JsonKey(name: 'authorized_by') String authorizedBy,
      @JsonKey(name: 'authorized_date') DateTime? authorizedDate,
      @JsonKey(name: 'picked_by') String pickedBy,
      @JsonKey(name: 'picked_date') DateTime? pickedDate,
      @JsonKey(name: 'emirates_id') String emiratesId});
}

/// @nodoc
class _$WarehouseParamsCopyWithImpl<$Res, $Val extends WarehouseParams>
    implements $WarehouseParamsCopyWith<$Res> {
  _$WarehouseParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? arrivalDate = freezed,
    Object? storageCost = null,
    Object? pickingDate = freezed,
    Object? authorizedBy = null,
    Object? authorizedDate = freezed,
    Object? pickedBy = null,
    Object? pickedDate = freezed,
    Object? emiratesId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalDate: freezed == arrivalDate
          ? _value.arrivalDate
          : arrivalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storageCost: null == storageCost
          ? _value.storageCost
          : storageCost // ignore: cast_nullable_to_non_nullable
              as String,
      pickingDate: freezed == pickingDate
          ? _value.pickingDate
          : pickingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authorizedBy: null == authorizedBy
          ? _value.authorizedBy
          : authorizedBy // ignore: cast_nullable_to_non_nullable
              as String,
      authorizedDate: freezed == authorizedDate
          ? _value.authorizedDate
          : authorizedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickedBy: null == pickedBy
          ? _value.pickedBy
          : pickedBy // ignore: cast_nullable_to_non_nullable
              as String,
      pickedDate: freezed == pickedDate
          ? _value.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emiratesId: null == emiratesId
          ? _value.emiratesId
          : emiratesId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WarehouseParamsImplCopyWith<$Res>
    implements $WarehouseParamsCopyWith<$Res> {
  factory _$$WarehouseParamsImplCopyWith(_$WarehouseParamsImpl value,
          $Res Function(_$WarehouseParamsImpl) then) =
      __$$WarehouseParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'warehouse_name') String name,
      @JsonKey(name: 'arrival_date') DateTime? arrivalDate,
      @JsonKey(name: 'storage_cost') String storageCost,
      @JsonKey(name: 'picking_date') DateTime? pickingDate,
      @JsonKey(name: 'authorized_by') String authorizedBy,
      @JsonKey(name: 'authorized_date') DateTime? authorizedDate,
      @JsonKey(name: 'picked_by') String pickedBy,
      @JsonKey(name: 'picked_date') DateTime? pickedDate,
      @JsonKey(name: 'emirates_id') String emiratesId});
}

/// @nodoc
class __$$WarehouseParamsImplCopyWithImpl<$Res>
    extends _$WarehouseParamsCopyWithImpl<$Res, _$WarehouseParamsImpl>
    implements _$$WarehouseParamsImplCopyWith<$Res> {
  __$$WarehouseParamsImplCopyWithImpl(
      _$WarehouseParamsImpl _value, $Res Function(_$WarehouseParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? arrivalDate = freezed,
    Object? storageCost = null,
    Object? pickingDate = freezed,
    Object? authorizedBy = null,
    Object? authorizedDate = freezed,
    Object? pickedBy = null,
    Object? pickedDate = freezed,
    Object? emiratesId = null,
  }) {
    return _then(_$WarehouseParamsImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      arrivalDate: freezed == arrivalDate
          ? _value.arrivalDate
          : arrivalDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storageCost: null == storageCost
          ? _value.storageCost
          : storageCost // ignore: cast_nullable_to_non_nullable
              as String,
      pickingDate: freezed == pickingDate
          ? _value.pickingDate
          : pickingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      authorizedBy: null == authorizedBy
          ? _value.authorizedBy
          : authorizedBy // ignore: cast_nullable_to_non_nullable
              as String,
      authorizedDate: freezed == authorizedDate
          ? _value.authorizedDate
          : authorizedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickedBy: null == pickedBy
          ? _value.pickedBy
          : pickedBy // ignore: cast_nullable_to_non_nullable
              as String,
      pickedDate: freezed == pickedDate
          ? _value.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emiratesId: null == emiratesId
          ? _value.emiratesId
          : emiratesId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WarehouseParamsImpl
    with DiagnosticableTreeMixin
    implements _WarehouseParams {
  const _$WarehouseParamsImpl(
      {@JsonKey(name: 'warehouse_name') this.name = '',
      @JsonKey(name: 'arrival_date') this.arrivalDate,
      @JsonKey(name: 'storage_cost') this.storageCost = '',
      @JsonKey(name: 'picking_date') this.pickingDate,
      @JsonKey(name: 'authorized_by') this.authorizedBy = '',
      @JsonKey(name: 'authorized_date') this.authorizedDate,
      @JsonKey(name: 'picked_by') this.pickedBy = '',
      @JsonKey(name: 'picked_date') this.pickedDate,
      @JsonKey(name: 'emirates_id') this.emiratesId = ''});

  factory _$WarehouseParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WarehouseParamsImplFromJson(json);

  @override
  @JsonKey(name: 'warehouse_name')
  final String name;
  @override
  @JsonKey(name: 'arrival_date')
  final DateTime? arrivalDate;
  @override
  @JsonKey(name: 'storage_cost')
  final String storageCost;
  @override
  @JsonKey(name: 'picking_date')
  final DateTime? pickingDate;
  @override
  @JsonKey(name: 'authorized_by')
  final String authorizedBy;
  @override
  @JsonKey(name: 'authorized_date')
  final DateTime? authorizedDate;
  @override
  @JsonKey(name: 'picked_by')
  final String pickedBy;
  @override
  @JsonKey(name: 'picked_date')
  final DateTime? pickedDate;
  @override
  @JsonKey(name: 'emirates_id')
  final String emiratesId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WarehouseParams(name: $name, arrivalDate: $arrivalDate, storageCost: $storageCost, pickingDate: $pickingDate, authorizedBy: $authorizedBy, authorizedDate: $authorizedDate, pickedBy: $pickedBy, pickedDate: $pickedDate, emiratesId: $emiratesId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WarehouseParams'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('arrivalDate', arrivalDate))
      ..add(DiagnosticsProperty('storageCost', storageCost))
      ..add(DiagnosticsProperty('pickingDate', pickingDate))
      ..add(DiagnosticsProperty('authorizedBy', authorizedBy))
      ..add(DiagnosticsProperty('authorizedDate', authorizedDate))
      ..add(DiagnosticsProperty('pickedBy', pickedBy))
      ..add(DiagnosticsProperty('pickedDate', pickedDate))
      ..add(DiagnosticsProperty('emiratesId', emiratesId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarehouseParamsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.arrivalDate, arrivalDate) ||
                other.arrivalDate == arrivalDate) &&
            (identical(other.storageCost, storageCost) ||
                other.storageCost == storageCost) &&
            (identical(other.pickingDate, pickingDate) ||
                other.pickingDate == pickingDate) &&
            (identical(other.authorizedBy, authorizedBy) ||
                other.authorizedBy == authorizedBy) &&
            (identical(other.authorizedDate, authorizedDate) ||
                other.authorizedDate == authorizedDate) &&
            (identical(other.pickedBy, pickedBy) ||
                other.pickedBy == pickedBy) &&
            (identical(other.pickedDate, pickedDate) ||
                other.pickedDate == pickedDate) &&
            (identical(other.emiratesId, emiratesId) ||
                other.emiratesId == emiratesId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      arrivalDate,
      storageCost,
      pickingDate,
      authorizedBy,
      authorizedDate,
      pickedBy,
      pickedDate,
      emiratesId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WarehouseParamsImplCopyWith<_$WarehouseParamsImpl> get copyWith =>
      __$$WarehouseParamsImplCopyWithImpl<_$WarehouseParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WarehouseParamsImplToJson(
      this,
    );
  }
}

abstract class _WarehouseParams implements WarehouseParams {
  const factory _WarehouseParams(
          {@JsonKey(name: 'warehouse_name') final String name,
          @JsonKey(name: 'arrival_date') final DateTime? arrivalDate,
          @JsonKey(name: 'storage_cost') final String storageCost,
          @JsonKey(name: 'picking_date') final DateTime? pickingDate,
          @JsonKey(name: 'authorized_by') final String authorizedBy,
          @JsonKey(name: 'authorized_date') final DateTime? authorizedDate,
          @JsonKey(name: 'picked_by') final String pickedBy,
          @JsonKey(name: 'picked_date') final DateTime? pickedDate,
          @JsonKey(name: 'emirates_id') final String emiratesId}) =
      _$WarehouseParamsImpl;

  factory _WarehouseParams.fromJson(Map<String, dynamic> json) =
      _$WarehouseParamsImpl.fromJson;

  @override
  @JsonKey(name: 'warehouse_name')
  String get name;
  @override
  @JsonKey(name: 'arrival_date')
  DateTime? get arrivalDate;
  @override
  @JsonKey(name: 'storage_cost')
  String get storageCost;
  @override
  @JsonKey(name: 'picking_date')
  DateTime? get pickingDate;
  @override
  @JsonKey(name: 'authorized_by')
  String get authorizedBy;
  @override
  @JsonKey(name: 'authorized_date')
  DateTime? get authorizedDate;
  @override
  @JsonKey(name: 'picked_by')
  String get pickedBy;
  @override
  @JsonKey(name: 'picked_date')
  DateTime? get pickedDate;
  @override
  @JsonKey(name: 'emirates_id')
  String get emiratesId;
  @override
  @JsonKey(ignore: true)
  _$$WarehouseParamsImplCopyWith<_$WarehouseParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VccParams _$VccParamsFromJson(Map<String, dynamic> json) {
  return _VccParams.fromJson(json);
}

/// @nodoc
mixin _$VccParams {
  @JsonKey(name: 'received_date')
  DateTime? get receivedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'issued_by')
  String get issuedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'issued_date')
  DateTime? get issuedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'picked_by')
  String get pickedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'picked_date')
  DateTime? get pickedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'emirates_id')
  String get emiratesId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VccParamsCopyWith<VccParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VccParamsCopyWith<$Res> {
  factory $VccParamsCopyWith(VccParams value, $Res Function(VccParams) then) =
      _$VccParamsCopyWithImpl<$Res, VccParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'received_date') DateTime? receivedDate,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'issued_by') String issuedBy,
      @JsonKey(name: 'issued_date') DateTime? issuedDate,
      @JsonKey(name: 'picked_by') String pickedBy,
      @JsonKey(name: 'picked_date') DateTime? pickedDate,
      @JsonKey(name: 'emirates_id') String emiratesId});
}

/// @nodoc
class _$VccParamsCopyWithImpl<$Res, $Val extends VccParams>
    implements $VccParamsCopyWith<$Res> {
  _$VccParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receivedDate = freezed,
    Object? url = null,
    Object? issuedBy = null,
    Object? issuedDate = freezed,
    Object? pickedBy = null,
    Object? pickedDate = freezed,
    Object? emiratesId = null,
  }) {
    return _then(_value.copyWith(
      receivedDate: freezed == receivedDate
          ? _value.receivedDate
          : receivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      issuedBy: null == issuedBy
          ? _value.issuedBy
          : issuedBy // ignore: cast_nullable_to_non_nullable
              as String,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickedBy: null == pickedBy
          ? _value.pickedBy
          : pickedBy // ignore: cast_nullable_to_non_nullable
              as String,
      pickedDate: freezed == pickedDate
          ? _value.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emiratesId: null == emiratesId
          ? _value.emiratesId
          : emiratesId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VccParamsImplCopyWith<$Res>
    implements $VccParamsCopyWith<$Res> {
  factory _$$VccParamsImplCopyWith(
          _$VccParamsImpl value, $Res Function(_$VccParamsImpl) then) =
      __$$VccParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'received_date') DateTime? receivedDate,
      @JsonKey(name: 'url') String url,
      @JsonKey(name: 'issued_by') String issuedBy,
      @JsonKey(name: 'issued_date') DateTime? issuedDate,
      @JsonKey(name: 'picked_by') String pickedBy,
      @JsonKey(name: 'picked_date') DateTime? pickedDate,
      @JsonKey(name: 'emirates_id') String emiratesId});
}

/// @nodoc
class __$$VccParamsImplCopyWithImpl<$Res>
    extends _$VccParamsCopyWithImpl<$Res, _$VccParamsImpl>
    implements _$$VccParamsImplCopyWith<$Res> {
  __$$VccParamsImplCopyWithImpl(
      _$VccParamsImpl _value, $Res Function(_$VccParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receivedDate = freezed,
    Object? url = null,
    Object? issuedBy = null,
    Object? issuedDate = freezed,
    Object? pickedBy = null,
    Object? pickedDate = freezed,
    Object? emiratesId = null,
  }) {
    return _then(_$VccParamsImpl(
      receivedDate: freezed == receivedDate
          ? _value.receivedDate
          : receivedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      issuedBy: null == issuedBy
          ? _value.issuedBy
          : issuedBy // ignore: cast_nullable_to_non_nullable
              as String,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pickedBy: null == pickedBy
          ? _value.pickedBy
          : pickedBy // ignore: cast_nullable_to_non_nullable
              as String,
      pickedDate: freezed == pickedDate
          ? _value.pickedDate
          : pickedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      emiratesId: null == emiratesId
          ? _value.emiratesId
          : emiratesId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VccParamsImpl with DiagnosticableTreeMixin implements _VccParams {
  const _$VccParamsImpl(
      {@JsonKey(name: 'received_date') this.receivedDate,
      @JsonKey(name: 'url') this.url = '',
      @JsonKey(name: 'issued_by') this.issuedBy = '',
      @JsonKey(name: 'issued_date') this.issuedDate,
      @JsonKey(name: 'picked_by') this.pickedBy = '',
      @JsonKey(name: 'picked_date') this.pickedDate,
      @JsonKey(name: 'emirates_id') this.emiratesId = ''});

  factory _$VccParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VccParamsImplFromJson(json);

  @override
  @JsonKey(name: 'received_date')
  final DateTime? receivedDate;
  @override
  @JsonKey(name: 'url')
  final String url;
  @override
  @JsonKey(name: 'issued_by')
  final String issuedBy;
  @override
  @JsonKey(name: 'issued_date')
  final DateTime? issuedDate;
  @override
  @JsonKey(name: 'picked_by')
  final String pickedBy;
  @override
  @JsonKey(name: 'picked_date')
  final DateTime? pickedDate;
  @override
  @JsonKey(name: 'emirates_id')
  final String emiratesId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VccParams(receivedDate: $receivedDate, url: $url, issuedBy: $issuedBy, issuedDate: $issuedDate, pickedBy: $pickedBy, pickedDate: $pickedDate, emiratesId: $emiratesId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VccParams'))
      ..add(DiagnosticsProperty('receivedDate', receivedDate))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('issuedBy', issuedBy))
      ..add(DiagnosticsProperty('issuedDate', issuedDate))
      ..add(DiagnosticsProperty('pickedBy', pickedBy))
      ..add(DiagnosticsProperty('pickedDate', pickedDate))
      ..add(DiagnosticsProperty('emiratesId', emiratesId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VccParamsImpl &&
            (identical(other.receivedDate, receivedDate) ||
                other.receivedDate == receivedDate) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.issuedBy, issuedBy) ||
                other.issuedBy == issuedBy) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.pickedBy, pickedBy) ||
                other.pickedBy == pickedBy) &&
            (identical(other.pickedDate, pickedDate) ||
                other.pickedDate == pickedDate) &&
            (identical(other.emiratesId, emiratesId) ||
                other.emiratesId == emiratesId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, receivedDate, url, issuedBy,
      issuedDate, pickedBy, pickedDate, emiratesId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VccParamsImplCopyWith<_$VccParamsImpl> get copyWith =>
      __$$VccParamsImplCopyWithImpl<_$VccParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VccParamsImplToJson(
      this,
    );
  }
}

abstract class _VccParams implements VccParams {
  const factory _VccParams(
      {@JsonKey(name: 'received_date') final DateTime? receivedDate,
      @JsonKey(name: 'url') final String url,
      @JsonKey(name: 'issued_by') final String issuedBy,
      @JsonKey(name: 'issued_date') final DateTime? issuedDate,
      @JsonKey(name: 'picked_by') final String pickedBy,
      @JsonKey(name: 'picked_date') final DateTime? pickedDate,
      @JsonKey(name: 'emirates_id') final String emiratesId}) = _$VccParamsImpl;

  factory _VccParams.fromJson(Map<String, dynamic> json) =
      _$VccParamsImpl.fromJson;

  @override
  @JsonKey(name: 'received_date')
  DateTime? get receivedDate;
  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(name: 'issued_by')
  String get issuedBy;
  @override
  @JsonKey(name: 'issued_date')
  DateTime? get issuedDate;
  @override
  @JsonKey(name: 'picked_by')
  String get pickedBy;
  @override
  @JsonKey(name: 'picked_date')
  DateTime? get pickedDate;
  @override
  @JsonKey(name: 'emirates_id')
  String get emiratesId;
  @override
  @JsonKey(ignore: true)
  _$$VccParamsImplCopyWith<_$VccParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
