// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_dashboard_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BillingDashboardState {
  String get message =>
      throw _privateConstructorUsedError; //@Default(0) int screen,
// @Default(SizedBox()) Widget screen,
  Widget get screen => throw _privateConstructorUsedError;
  BillingDashboardStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BillingDashboardStateCopyWith<BillingDashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BillingDashboardStateCopyWith<$Res> {
  factory $BillingDashboardStateCopyWith(BillingDashboardState value,
          $Res Function(BillingDashboardState) then) =
      _$BillingDashboardStateCopyWithImpl<$Res, BillingDashboardState>;
  @useResult
  $Res call({String message, Widget screen, BillingDashboardStatus status});
}

/// @nodoc
class _$BillingDashboardStateCopyWithImpl<$Res,
        $Val extends BillingDashboardState>
    implements $BillingDashboardStateCopyWith<$Res> {
  _$BillingDashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? screen = null,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BillingDashboardStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BillingDashboardStateImplCopyWith<$Res>
    implements $BillingDashboardStateCopyWith<$Res> {
  factory _$$BillingDashboardStateImplCopyWith(
          _$BillingDashboardStateImpl value,
          $Res Function(_$BillingDashboardStateImpl) then) =
      __$$BillingDashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, Widget screen, BillingDashboardStatus status});
}

/// @nodoc
class __$$BillingDashboardStateImplCopyWithImpl<$Res>
    extends _$BillingDashboardStateCopyWithImpl<$Res,
        _$BillingDashboardStateImpl>
    implements _$$BillingDashboardStateImplCopyWith<$Res> {
  __$$BillingDashboardStateImplCopyWithImpl(_$BillingDashboardStateImpl _value,
      $Res Function(_$BillingDashboardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? screen = null,
    Object? status = null,
  }) {
    return _then(_$BillingDashboardStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      screen: null == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as Widget,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BillingDashboardStatus,
    ));
  }
}

/// @nodoc

class _$BillingDashboardStateImpl implements _BillingDashboardState {
  _$BillingDashboardStateImpl(
      {this.message = '',
      this.screen = const Center(child: BillingInventoryScreen()),
      this.status = BillingDashboardStatus.initial});

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
  final BillingDashboardStatus status;

  @override
  String toString() {
    return 'BillingDashboardState(message: $message, screen: $screen, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BillingDashboardStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.screen, screen) || other.screen == screen) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, screen, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BillingDashboardStateImplCopyWith<_$BillingDashboardStateImpl>
      get copyWith => __$$BillingDashboardStateImplCopyWithImpl<
          _$BillingDashboardStateImpl>(this, _$identity);
}

abstract class _BillingDashboardState implements BillingDashboardState {
  factory _BillingDashboardState(
      {final String message,
      final Widget screen,
      final BillingDashboardStatus status}) = _$BillingDashboardStateImpl;

  @override
  String get message;
  @override //@Default(0) int screen,
// @Default(SizedBox()) Widget screen,
  Widget get screen;
  @override
  BillingDashboardStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$BillingDashboardStateImplCopyWith<_$BillingDashboardStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
