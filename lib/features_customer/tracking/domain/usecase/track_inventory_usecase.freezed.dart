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

TrackingParams _$TrackingParamsFromJson(Map<String, dynamic> json) {
  return _TrackingParams.fromJson(json);
}

/// @nodoc
mixin _$TrackingParams {
  @JsonKey(name: 'vin_number')
  String get vinNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'lot_number')
  String get lotNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackingParamsCopyWith<TrackingParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingParamsCopyWith<$Res> {
  factory $TrackingParamsCopyWith(
          TrackingParams value, $Res Function(TrackingParams) then) =
      _$TrackingParamsCopyWithImpl<$Res, TrackingParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'vin_number') String vinNumber,
      @JsonKey(name: 'lot_number') String lotNumber});
}

/// @nodoc
class _$TrackingParamsCopyWithImpl<$Res, $Val extends TrackingParams>
    implements $TrackingParamsCopyWith<$Res> {
  _$TrackingParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$TrackingParamsImplCopyWith<$Res>
    implements $TrackingParamsCopyWith<$Res> {
  factory _$$TrackingParamsImplCopyWith(_$TrackingParamsImpl value,
          $Res Function(_$TrackingParamsImpl) then) =
      __$$TrackingParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'vin_number') String vinNumber,
      @JsonKey(name: 'lot_number') String lotNumber});
}

/// @nodoc
class __$$TrackingParamsImplCopyWithImpl<$Res>
    extends _$TrackingParamsCopyWithImpl<$Res, _$TrackingParamsImpl>
    implements _$$TrackingParamsImplCopyWith<$Res> {
  __$$TrackingParamsImplCopyWithImpl(
      _$TrackingParamsImpl _value, $Res Function(_$TrackingParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vinNumber = null,
    Object? lotNumber = null,
  }) {
    return _then(_$TrackingParamsImpl(
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
class _$TrackingParamsImpl implements _TrackingParams {
  const _$TrackingParamsImpl(
      {@JsonKey(name: 'vin_number') this.vinNumber = '',
      @JsonKey(name: 'lot_number') this.lotNumber = ''});

  factory _$TrackingParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingParamsImplFromJson(json);

  @override
  @JsonKey(name: 'vin_number')
  final String vinNumber;
  @override
  @JsonKey(name: 'lot_number')
  final String lotNumber;

  @override
  String toString() {
    return 'TrackingParams(vinNumber: $vinNumber, lotNumber: $lotNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingParamsImpl &&
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
  _$$TrackingParamsImplCopyWith<_$TrackingParamsImpl> get copyWith =>
      __$$TrackingParamsImplCopyWithImpl<_$TrackingParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingParamsImplToJson(
      this,
    );
  }
}

abstract class _TrackingParams implements TrackingParams {
  const factory _TrackingParams(
          {@JsonKey(name: 'vin_number') final String vinNumber,
          @JsonKey(name: 'lot_number') final String lotNumber}) =
      _$TrackingParamsImpl;

  factory _TrackingParams.fromJson(Map<String, dynamic> json) =
      _$TrackingParamsImpl.fromJson;

  @override
  @JsonKey(name: 'vin_number')
  String get vinNumber;
  @override
  @JsonKey(name: 'lot_number')
  String get lotNumber;
  @override
  @JsonKey(ignore: true)
  _$$TrackingParamsImplCopyWith<_$TrackingParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
