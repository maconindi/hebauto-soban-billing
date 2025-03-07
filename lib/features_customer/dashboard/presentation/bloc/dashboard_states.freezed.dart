// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardState {
  String get message =>
      throw _privateConstructorUsedError; //@Default(0) int screen,
// @Default(SizedBox()) Widget screen,
  Widget get screen => throw _privateConstructorUsedError;
  InventoryStatsEntity get inventoryStatsEntity =>
      throw _privateConstructorUsedError;
  DashboardStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call(
      {String message,
      Widget screen,
      InventoryStatsEntity inventoryStatsEntity,
      DashboardStatus status});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? screen = null,
    Object? inventoryStatsEntity = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Widget,
      inventoryStatsEntity: null == inventoryStatsEntity
          ? _value.inventoryStatsEntity
          : inventoryStatsEntity // ignore: cast_nullable_to_non_nullable
              as InventoryStatsEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DashboardStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardStateImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$DashboardStateImplCopyWith(_$DashboardStateImpl value,
          $Res Function(_$DashboardStateImpl) then) =
      __$$DashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      Widget screen,
      InventoryStatsEntity inventoryStatsEntity,
      DashboardStatus status});
}

/// @nodoc
class __$$DashboardStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardStateImpl>
    implements _$$DashboardStateImplCopyWith<$Res> {
  __$$DashboardStateImplCopyWithImpl(
      _$DashboardStateImpl _value, $Res Function(_$DashboardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? screen = null,
    Object? inventoryStatsEntity = null,
    Object? status = null,
  }) {
    return _then(_$DashboardStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Widget,
      inventoryStatsEntity: null == inventoryStatsEntity
          ? _value.inventoryStatsEntity
          : inventoryStatsEntity // ignore: cast_nullable_to_non_nullable
              as InventoryStatsEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DashboardStatus,
    ));
  }
}

/// @nodoc

class _$DashboardStateImpl implements _DashboardState {
  _$DashboardStateImpl(
      {this.message = '',
      this.screen = const Center(child: DashboardMain()),
      this.inventoryStatsEntity = const InventoryStatsEntity(),
      this.status = DashboardStatus.initial});

  @override
  @JsonKey()
  final String message;
//@Default(0) int screen,
// @Default(SizedBox()) Widget screen,
  @override
  @JsonKey()
  final Widget screen;
  @override
  @JsonKey()
  final InventoryStatsEntity inventoryStatsEntity;
  @override
  @JsonKey()
  final DashboardStatus status;

  @override
  String toString() {
    return 'DashboardState(message: $message, screen: $screen, inventoryStatsEntity: $inventoryStatsEntity, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.screen, screen) || other.screen == screen) &&
            (identical(other.inventoryStatsEntity, inventoryStatsEntity) ||
                other.inventoryStatsEntity == inventoryStatsEntity) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, message, screen, inventoryStatsEntity, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      __$$DashboardStateImplCopyWithImpl<_$DashboardStateImpl>(
          this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  factory _DashboardState(
      {final String message,
      final Widget screen,
      final InventoryStatsEntity inventoryStatsEntity,
      final DashboardStatus status}) = _$DashboardStateImpl;

  @override
  String get message;
  @override //@Default(0) int screen,
// @Default(SizedBox()) Widget screen,
  Widget get screen;
  @override
  InventoryStatsEntity get inventoryStatsEntity;
  @override
  DashboardStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
