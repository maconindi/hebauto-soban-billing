// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart_of_accounts_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddChartOfAccountsParams _$AddChartOfAccountsParamsFromJson(
    Map<String, dynamic> json) {
  return _AddChartOfAccountsParams.fromJson(json);
}

/// @nodoc
mixin _$AddChartOfAccountsParams {
  @JsonKey(name: 'item_id')
  int get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_item_id')
  int get parentItemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  int get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddChartOfAccountsParamsCopyWith<AddChartOfAccountsParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddChartOfAccountsParamsCopyWith<$Res> {
  factory $AddChartOfAccountsParamsCopyWith(AddChartOfAccountsParams value,
          $Res Function(AddChartOfAccountsParams) then) =
      _$AddChartOfAccountsParamsCopyWithImpl<$Res, AddChartOfAccountsParams>;
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id') int itemId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'parent_item_id') int parentItemId,
      @JsonKey(name: 'level') int level});
}

/// @nodoc
class _$AddChartOfAccountsParamsCopyWithImpl<$Res,
        $Val extends AddChartOfAccountsParams>
    implements $AddChartOfAccountsParamsCopyWith<$Res> {
  _$AddChartOfAccountsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? name = null,
    Object? code = null,
    Object? parentItemId = null,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      parentItemId: null == parentItemId
          ? _value.parentItemId
          : parentItemId // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddChartOfAccountsParamsImplCopyWith<$Res>
    implements $AddChartOfAccountsParamsCopyWith<$Res> {
  factory _$$AddChartOfAccountsParamsImplCopyWith(
          _$AddChartOfAccountsParamsImpl value,
          $Res Function(_$AddChartOfAccountsParamsImpl) then) =
      __$$AddChartOfAccountsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'item_id') int itemId,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'parent_item_id') int parentItemId,
      @JsonKey(name: 'level') int level});
}

/// @nodoc
class __$$AddChartOfAccountsParamsImplCopyWithImpl<$Res>
    extends _$AddChartOfAccountsParamsCopyWithImpl<$Res,
        _$AddChartOfAccountsParamsImpl>
    implements _$$AddChartOfAccountsParamsImplCopyWith<$Res> {
  __$$AddChartOfAccountsParamsImplCopyWithImpl(
      _$AddChartOfAccountsParamsImpl _value,
      $Res Function(_$AddChartOfAccountsParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? name = null,
    Object? code = null,
    Object? parentItemId = null,
    Object? level = null,
  }) {
    return _then(_$AddChartOfAccountsParamsImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      parentItemId: null == parentItemId
          ? _value.parentItemId
          : parentItemId // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddChartOfAccountsParamsImpl implements _AddChartOfAccountsParams {
  const _$AddChartOfAccountsParamsImpl(
      {@JsonKey(name: 'item_id') this.itemId = 0,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'code') this.code = '',
      @JsonKey(name: 'parent_item_id') this.parentItemId = 0,
      @JsonKey(name: 'level') this.level = 0});

  factory _$AddChartOfAccountsParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddChartOfAccountsParamsImplFromJson(json);

  @override
  @JsonKey(name: 'item_id')
  final int itemId;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'parent_item_id')
  final int parentItemId;
  @override
  @JsonKey(name: 'level')
  final int level;

  @override
  String toString() {
    return 'AddChartOfAccountsParams(itemId: $itemId, name: $name, code: $code, parentItemId: $parentItemId, level: $level)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddChartOfAccountsParamsImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.parentItemId, parentItemId) ||
                other.parentItemId == parentItemId) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, itemId, name, code, parentItemId, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddChartOfAccountsParamsImplCopyWith<_$AddChartOfAccountsParamsImpl>
      get copyWith => __$$AddChartOfAccountsParamsImplCopyWithImpl<
          _$AddChartOfAccountsParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddChartOfAccountsParamsImplToJson(
      this,
    );
  }
}

abstract class _AddChartOfAccountsParams implements AddChartOfAccountsParams {
  const factory _AddChartOfAccountsParams(
          {@JsonKey(name: 'item_id') final int itemId,
          @JsonKey(name: 'name') final String name,
          @JsonKey(name: 'code') final String code,
          @JsonKey(name: 'parent_item_id') final int parentItemId,
          @JsonKey(name: 'level') final int level}) =
      _$AddChartOfAccountsParamsImpl;

  factory _AddChartOfAccountsParams.fromJson(Map<String, dynamic> json) =
      _$AddChartOfAccountsParamsImpl.fromJson;

  @override
  @JsonKey(name: 'item_id')
  int get itemId;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'parent_item_id')
  int get parentItemId;
  @override
  @JsonKey(name: 'level')
  int get level;
  @override
  @JsonKey(ignore: true)
  _$$AddChartOfAccountsParamsImplCopyWith<_$AddChartOfAccountsParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
