// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_tracking_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminTrackingState {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  TrackItemEntity get data => throw _privateConstructorUsedError;
  TrackingStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdminTrackingStateCopyWith<AdminTrackingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminTrackingStateCopyWith<$Res> {
  factory $AdminTrackingStateCopyWith(
          AdminTrackingState value, $Res Function(AdminTrackingState) then) =
      _$AdminTrackingStateCopyWithImpl<$Res, AdminTrackingState>;
  @useResult
  $Res call(
      {bool success,
      String message,
      TrackItemEntity data,
      TrackingStatus status});
}

/// @nodoc
class _$AdminTrackingStateCopyWithImpl<$Res, $Val extends AdminTrackingState>
    implements $AdminTrackingStateCopyWith<$Res> {
  _$AdminTrackingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
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
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TrackItemEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TrackingStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminTrackingStateImplCopyWith<$Res>
    implements $AdminTrackingStateCopyWith<$Res> {
  factory _$$AdminTrackingStateImplCopyWith(_$AdminTrackingStateImpl value,
          $Res Function(_$AdminTrackingStateImpl) then) =
      __$$AdminTrackingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool success,
      String message,
      TrackItemEntity data,
      TrackingStatus status});
}

/// @nodoc
class __$$AdminTrackingStateImplCopyWithImpl<$Res>
    extends _$AdminTrackingStateCopyWithImpl<$Res, _$AdminTrackingStateImpl>
    implements _$$AdminTrackingStateImplCopyWith<$Res> {
  __$$AdminTrackingStateImplCopyWithImpl(_$AdminTrackingStateImpl _value,
      $Res Function(_$AdminTrackingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
    Object? status = null,
  }) {
    return _then(_$AdminTrackingStateImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TrackItemEntity,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TrackingStatus,
    ));
  }
}

/// @nodoc

class _$AdminTrackingStateImpl implements _AdminTrackingState {
  _$AdminTrackingStateImpl(
      {this.success = false,
      this.message = '',
      this.data = const TrackItemEntity(),
      this.status = TrackingStatus.initial});

  @override
  @JsonKey()
  final bool success;
  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final TrackItemEntity data;
  @override
  @JsonKey()
  final TrackingStatus status;

  @override
  String toString() {
    return 'AdminTrackingState(success: $success, message: $message, data: $data, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminTrackingStateImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success, message, data, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminTrackingStateImplCopyWith<_$AdminTrackingStateImpl> get copyWith =>
      __$$AdminTrackingStateImplCopyWithImpl<_$AdminTrackingStateImpl>(
          this, _$identity);
}

abstract class _AdminTrackingState implements AdminTrackingState {
  factory _AdminTrackingState(
      {final bool success,
      final String message,
      final TrackItemEntity data,
      final TrackingStatus status}) = _$AdminTrackingStateImpl;

  @override
  bool get success;
  @override
  String get message;
  @override
  TrackItemEntity get data;
  @override
  TrackingStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$AdminTrackingStateImplCopyWith<_$AdminTrackingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
