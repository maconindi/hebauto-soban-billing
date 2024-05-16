// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_customer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddCustomerState {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DashboardStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddCustomerStateCopyWith<AddCustomerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddCustomerStateCopyWith<$Res> {
  factory $AddCustomerStateCopyWith(
          AddCustomerState value, $Res Function(AddCustomerState) then) =
      _$AddCustomerStateCopyWithImpl<$Res, AddCustomerState>;
  @useResult
  $Res call({bool success, String message, DashboardStatus status});
}

/// @nodoc
class _$AddCustomerStateCopyWithImpl<$Res, $Val extends AddCustomerState>
    implements $AddCustomerStateCopyWith<$Res> {
  _$AddCustomerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DashboardStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddCustomerStateImplCopyWith<$Res>
    implements $AddCustomerStateCopyWith<$Res> {
  factory _$$AddCustomerStateImplCopyWith(_$AddCustomerStateImpl value,
          $Res Function(_$AddCustomerStateImpl) then) =
      __$$AddCustomerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, DashboardStatus status});
}

/// @nodoc
class __$$AddCustomerStateImplCopyWithImpl<$Res>
    extends _$AddCustomerStateCopyWithImpl<$Res, _$AddCustomerStateImpl>
    implements _$$AddCustomerStateImplCopyWith<$Res> {
  __$$AddCustomerStateImplCopyWithImpl(_$AddCustomerStateImpl _value,
      $Res Function(_$AddCustomerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$AddCustomerStateImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DashboardStatus,
    ));
  }
}

/// @nodoc

class _$AddCustomerStateImpl implements _AddCustomerState {
  _$AddCustomerStateImpl(
      {this.success = false,
      this.message = '',
      this.status = DashboardStatus.initial});

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final DashboardStatus status;

  @override
  String toString() {
    return 'AddCustomerState(success: $success, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCustomerStateImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCustomerStateImplCopyWith<_$AddCustomerStateImpl> get copyWith =>
      __$$AddCustomerStateImplCopyWithImpl<_$AddCustomerStateImpl>(
          this, _$identity);
}

abstract class _AddCustomerState implements AddCustomerState {
  factory _AddCustomerState(
      {final bool success,
      final String message,
      final DashboardStatus status}) = _$AddCustomerStateImpl;

  @override
  bool get success;
  @override
  String get message;
  @override
  DashboardStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$AddCustomerStateImplCopyWith<_$AddCustomerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
