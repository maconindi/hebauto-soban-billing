// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fetch_customers_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FetchCustomersState {
  bool get success => throw _privateConstructorUsedError;
  List<CustomerEntity> get data => throw _privateConstructorUsedError;
  CustomerEntity get customer => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  DashboardStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FetchCustomersStateCopyWith<FetchCustomersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FetchCustomersStateCopyWith<$Res> {
  factory $FetchCustomersStateCopyWith(
          FetchCustomersState value, $Res Function(FetchCustomersState) then) =
      _$FetchCustomersStateCopyWithImpl<$Res, FetchCustomersState>;
  @useResult
  $Res call(
      {bool success,
      List<CustomerEntity> data,
      CustomerEntity customer,
      String message,
      DashboardStatus status});
}

/// @nodoc
class _$FetchCustomersStateCopyWithImpl<$Res, $Val extends FetchCustomersState>
    implements $FetchCustomersStateCopyWith<$Res> {
  _$FetchCustomersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? customer = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CustomerEntity>,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity,
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
abstract class _$$FetchCustomersStateImplCopyWith<$Res>
    implements $FetchCustomersStateCopyWith<$Res> {
  factory _$$FetchCustomersStateImplCopyWith(_$FetchCustomersStateImpl value,
          $Res Function(_$FetchCustomersStateImpl) then) =
      __$$FetchCustomersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      List<CustomerEntity> data,
      CustomerEntity customer,
      String message,
      DashboardStatus status});
}

/// @nodoc
class __$$FetchCustomersStateImplCopyWithImpl<$Res>
    extends _$FetchCustomersStateCopyWithImpl<$Res, _$FetchCustomersStateImpl>
    implements _$$FetchCustomersStateImplCopyWith<$Res> {
  __$$FetchCustomersStateImplCopyWithImpl(_$FetchCustomersStateImpl _value,
      $Res Function(_$FetchCustomersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? data = null,
    Object? customer = null,
    Object? message = null,
    Object? status = null,
  }) {
    return _then(_$FetchCustomersStateImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CustomerEntity>,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerEntity,
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

class _$FetchCustomersStateImpl implements _FetchCustomersState {
  _$FetchCustomersStateImpl(
      {this.success = false,
      final List<CustomerEntity> data = const <CustomerEntity>[],
      this.customer = const CustomerEntity(),
      this.message = '',
      this.status = DashboardStatus.initial})
      : _data = data;

  @override
  @JsonKey()
  final bool success;
  final List<CustomerEntity> _data;
  @override
  @JsonKey()
  List<CustomerEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final CustomerEntity customer;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final DashboardStatus status;

  @override
  String toString() {
    return 'FetchCustomersState(success: $success, data: $data, customer: $customer, message: $message, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchCustomersStateImpl &&
            (identical(other.success, success) || other.success == success) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success,
      const DeepCollectionEquality().hash(_data), customer, message, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchCustomersStateImplCopyWith<_$FetchCustomersStateImpl> get copyWith =>
      __$$FetchCustomersStateImplCopyWithImpl<_$FetchCustomersStateImpl>(
          this, _$identity);
}

abstract class _FetchCustomersState implements FetchCustomersState {
  factory _FetchCustomersState(
      {final bool success,
      final List<CustomerEntity> data,
      final CustomerEntity customer,
      final String message,
      final DashboardStatus status}) = _$FetchCustomersStateImpl;

  @override
  bool get success;
  @override
  List<CustomerEntity> get data;
  @override
  CustomerEntity get customer;
  @override
  String get message;
  @override
  DashboardStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$FetchCustomersStateImplCopyWith<_$FetchCustomersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
