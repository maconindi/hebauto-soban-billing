// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track_inventory_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminTrackingParams _$AdminTrackingParamsFromJson(Map<String, dynamic> json) {
  return _AdminTrackingParams.fromJson(json);
}

/// @nodoc
mixin _$AdminTrackingParams {
  @JsonKey(name: 'vin_number')
  String get vinNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'lot_number')
  String get lotNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminTrackingParamsCopyWith<AdminTrackingParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminTrackingParamsCopyWith<$Res> {
  factory $AdminTrackingParamsCopyWith(
          AdminTrackingParams value, $Res Function(AdminTrackingParams) then) =
      _$AdminTrackingParamsCopyWithImpl<$Res, AdminTrackingParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'vin_number') String vinNumber,
      @JsonKey(name: 'lot_number') String lotNumber});
}

/// @nodoc
class _$AdminTrackingParamsCopyWithImpl<$Res, $Val extends AdminTrackingParams>
    implements $AdminTrackingParamsCopyWith<$Res> {
  _$AdminTrackingParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vinNumber = null,
    Object? lotNumber = null,
  }) {
    return _then(_value.copyWith(
      vinNumber: null == vinNumber
          ? _value.vinNumber
          : vinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminTrackingParamsImplCopyWith<$Res>
    implements $AdminTrackingParamsCopyWith<$Res> {
  factory _$$AdminTrackingParamsImplCopyWith(_$AdminTrackingParamsImpl value,
          $Res Function(_$AdminTrackingParamsImpl) then) =
      __$$AdminTrackingParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'vin_number') String vinNumber,
      @JsonKey(name: 'lot_number') String lotNumber});
}

/// @nodoc
class __$$AdminTrackingParamsImplCopyWithImpl<$Res>
    extends _$AdminTrackingParamsCopyWithImpl<$Res, _$AdminTrackingParamsImpl>
    implements _$$AdminTrackingParamsImplCopyWith<$Res> {
  __$$AdminTrackingParamsImplCopyWithImpl(_$AdminTrackingParamsImpl _value,
      $Res Function(_$AdminTrackingParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vinNumber = null,
    Object? lotNumber = null,
  }) {
    return _then(_$AdminTrackingParamsImpl(
      vinNumber: null == vinNumber
          ? _value.vinNumber
          : vinNumber // ignore: cast_nullable_to_non_nullable
              as String,
      lotNumber: null == lotNumber
          ? _value.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminTrackingParamsImpl implements _AdminTrackingParams {
  const _$AdminTrackingParamsImpl(
      {@JsonKey(name: 'vin_number') this.vinNumber = '',
      @JsonKey(name: 'lot_number') this.lotNumber = ''});

  factory _$AdminTrackingParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminTrackingParamsImplFromJson(json);

  @override
  @JsonKey(name: 'vin_number')
  final String vinNumber;
  @override
  @JsonKey(name: 'lot_number')
  final String lotNumber;

  @override
  String toString() {
    return 'AdminTrackingParams(vinNumber: $vinNumber, lotNumber: $lotNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminTrackingParamsImpl &&
            (identical(other.vinNumber, vinNumber) ||
                other.vinNumber == vinNumber) &&
            (identical(other.lotNumber, lotNumber) ||
                other.lotNumber == lotNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, vinNumber, lotNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminTrackingParamsImplCopyWith<_$AdminTrackingParamsImpl> get copyWith =>
      __$$AdminTrackingParamsImplCopyWithImpl<_$AdminTrackingParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminTrackingParamsImplToJson(
      this,
    );
  }
}

abstract class _AdminTrackingParams implements AdminTrackingParams {
  const factory _AdminTrackingParams(
          {@JsonKey(name: 'vin_number') final String vinNumber,
          @JsonKey(name: 'lot_number') final String lotNumber}) =
      _$AdminTrackingParamsImpl;

  factory _AdminTrackingParams.fromJson(Map<String, dynamic> json) =
      _$AdminTrackingParamsImpl.fromJson;

  @override
  @JsonKey(name: 'vin_number')
  String get vinNumber;
  @override
  @JsonKey(name: 'lot_number')
  String get lotNumber;
  @override
  @JsonKey(ignore: true)
  _$$AdminTrackingParamsImplCopyWith<_$AdminTrackingParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
