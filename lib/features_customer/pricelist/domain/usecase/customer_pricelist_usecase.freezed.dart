// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_pricelist_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerPriceListParams _$CustomerPriceListParamsFromJson(
    Map<String, dynamic> json) {
  return _CustomerPriceListParams.fromJson(json);
}

/// @nodoc
mixin _$CustomerPriceListParams {
  @JsonKey(name: 'cus_email')
  String get cusEmail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerPriceListParamsCopyWith<CustomerPriceListParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerPriceListParamsCopyWith<$Res> {
  factory $CustomerPriceListParamsCopyWith(CustomerPriceListParams value,
          $Res Function(CustomerPriceListParams) then) =
      _$CustomerPriceListParamsCopyWithImpl<$Res, CustomerPriceListParams>;
  @useResult
  $Res call({@JsonKey(name: 'cus_email') String cusEmail});
}

/// @nodoc
class _$CustomerPriceListParamsCopyWithImpl<$Res,
        $Val extends CustomerPriceListParams>
    implements $CustomerPriceListParamsCopyWith<$Res> {
  _$CustomerPriceListParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cusEmail = null,
  }) {
    return _then(_value.copyWith(
      cusEmail: null == cusEmail
          ? _value.cusEmail
          : cusEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerPriceListParamsImplCopyWith<$Res>
    implements $CustomerPriceListParamsCopyWith<$Res> {
  factory _$$CustomerPriceListParamsImplCopyWith(
          _$CustomerPriceListParamsImpl value,
          $Res Function(_$CustomerPriceListParamsImpl) then) =
      __$$CustomerPriceListParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'cus_email') String cusEmail});
}

/// @nodoc
class __$$CustomerPriceListParamsImplCopyWithImpl<$Res>
    extends _$CustomerPriceListParamsCopyWithImpl<$Res,
        _$CustomerPriceListParamsImpl>
    implements _$$CustomerPriceListParamsImplCopyWith<$Res> {
  __$$CustomerPriceListParamsImplCopyWithImpl(
      _$CustomerPriceListParamsImpl _value,
      $Res Function(_$CustomerPriceListParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cusEmail = null,
  }) {
    return _then(_$CustomerPriceListParamsImpl(
      cusEmail: null == cusEmail
          ? _value.cusEmail
          : cusEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerPriceListParamsImpl implements _CustomerPriceListParams {
  const _$CustomerPriceListParamsImpl(
      {@JsonKey(name: 'cus_email') this.cusEmail = ''});

  factory _$CustomerPriceListParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerPriceListParamsImplFromJson(json);

  @override
  @JsonKey(name: 'cus_email')
  final String cusEmail;

  @override
  String toString() {
    return 'CustomerPriceListParams(cusEmail: $cusEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerPriceListParamsImpl &&
            (identical(other.cusEmail, cusEmail) ||
                other.cusEmail == cusEmail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cusEmail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerPriceListParamsImplCopyWith<_$CustomerPriceListParamsImpl>
      get copyWith => __$$CustomerPriceListParamsImplCopyWithImpl<
          _$CustomerPriceListParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerPriceListParamsImplToJson(
      this,
    );
  }
}

abstract class _CustomerPriceListParams implements CustomerPriceListParams {
  const factory _CustomerPriceListParams(
          {@JsonKey(name: 'cus_email') final String cusEmail}) =
      _$CustomerPriceListParamsImpl;

  factory _CustomerPriceListParams.fromJson(Map<String, dynamic> json) =
      _$CustomerPriceListParamsImpl.fromJson;

  @override
  @JsonKey(name: 'cus_email')
  String get cusEmail;
  @override
  @JsonKey(ignore: true)
  _$$CustomerPriceListParamsImplCopyWith<_$CustomerPriceListParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
