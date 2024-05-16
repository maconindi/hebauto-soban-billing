// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricelist_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriceListParams _$PriceListParamsFromJson(Map<String, dynamic> json) {
  return _PriceListParams.fromJson(json);
}

/// @nodoc
mixin _$PriceListParams {
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'cus_email')
  String get cusEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'cus_name')
  String get cusName => throw _privateConstructorUsedError;
  @JsonKey(name: 'cus_company')
  String get cusCompany => throw _privateConstructorUsedError;
  @JsonKey(name: 'cus_id_fk')
  String get cusId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceListParamsCopyWith<PriceListParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceListParamsCopyWith<$Res> {
  factory $PriceListParamsCopyWith(
          PriceListParams value, $Res Function(PriceListParams) then) =
      _$PriceListParamsCopyWithImpl<$Res, PriceListParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String url,
      @JsonKey(name: 'cus_email') String cusEmail,
      @JsonKey(name: 'cus_name') String cusName,
      @JsonKey(name: 'cus_company') String cusCompany,
      @JsonKey(name: 'cus_id_fk') String cusId});
}

/// @nodoc
class _$PriceListParamsCopyWithImpl<$Res, $Val extends PriceListParams>
    implements $PriceListParamsCopyWith<$Res> {
  _$PriceListParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? cusEmail = null,
    Object? cusName = null,
    Object? cusCompany = null,
    Object? cusId = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
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
      cusId: null == cusId
          ? _value.cusId
          : cusId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceListParamsImplCopyWith<$Res>
    implements $PriceListParamsCopyWith<$Res> {
  factory _$$PriceListParamsImplCopyWith(_$PriceListParamsImpl value,
          $Res Function(_$PriceListParamsImpl) then) =
      __$$PriceListParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String url,
      @JsonKey(name: 'cus_email') String cusEmail,
      @JsonKey(name: 'cus_name') String cusName,
      @JsonKey(name: 'cus_company') String cusCompany,
      @JsonKey(name: 'cus_id_fk') String cusId});
}

/// @nodoc
class __$$PriceListParamsImplCopyWithImpl<$Res>
    extends _$PriceListParamsCopyWithImpl<$Res, _$PriceListParamsImpl>
    implements _$$PriceListParamsImplCopyWith<$Res> {
  __$$PriceListParamsImplCopyWithImpl(
      _$PriceListParamsImpl _value, $Res Function(_$PriceListParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? cusEmail = null,
    Object? cusName = null,
    Object? cusCompany = null,
    Object? cusId = null,
  }) {
    return _then(_$PriceListParamsImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
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
      cusId: null == cusId
          ? _value.cusId
          : cusId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceListParamsImpl implements _PriceListParams {
  const _$PriceListParamsImpl(
      {@JsonKey(name: 'url') this.url = '',
      @JsonKey(name: 'cus_email') this.cusEmail = '',
      @JsonKey(name: 'cus_name') this.cusName = '',
      @JsonKey(name: 'cus_company') this.cusCompany = '',
      @JsonKey(name: 'cus_id_fk') this.cusId = ''});

  factory _$PriceListParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceListParamsImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String url;
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
  @JsonKey(name: 'cus_id_fk')
  final String cusId;

  @override
  String toString() {
    return 'PriceListParams(url: $url, cusEmail: $cusEmail, cusName: $cusName, cusCompany: $cusCompany, cusId: $cusId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceListParamsImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.cusEmail, cusEmail) ||
                other.cusEmail == cusEmail) &&
            (identical(other.cusName, cusName) || other.cusName == cusName) &&
            (identical(other.cusCompany, cusCompany) ||
                other.cusCompany == cusCompany) &&
            (identical(other.cusId, cusId) || other.cusId == cusId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, url, cusEmail, cusName, cusCompany, cusId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceListParamsImplCopyWith<_$PriceListParamsImpl> get copyWith =>
      __$$PriceListParamsImplCopyWithImpl<_$PriceListParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceListParamsImplToJson(
      this,
    );
  }
}

abstract class _PriceListParams implements PriceListParams {
  const factory _PriceListParams(
      {@JsonKey(name: 'url') final String url,
      @JsonKey(name: 'cus_email') final String cusEmail,
      @JsonKey(name: 'cus_name') final String cusName,
      @JsonKey(name: 'cus_company') final String cusCompany,
      @JsonKey(name: 'cus_id_fk') final String cusId}) = _$PriceListParamsImpl;

  factory _PriceListParams.fromJson(Map<String, dynamic> json) =
      _$PriceListParamsImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String get url;
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
  @JsonKey(name: 'cus_id_fk')
  String get cusId;
  @override
  @JsonKey(ignore: true)
  _$$PriceListParamsImplCopyWith<_$PriceListParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
