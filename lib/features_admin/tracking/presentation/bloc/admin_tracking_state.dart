import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/track_item_entity.dart';

part 'admin_tracking_state.freezed.dart';

enum TrackingStatus { initial, success, error, loading }

extension TrackingStatusX on TrackingStatus {
  bool get isInitial => this == TrackingStatus.initial;

  bool get isSuccess => this == TrackingStatus.success;

  bool get isError => this == TrackingStatus.error;

  bool get isLoading => this == TrackingStatus.loading;
}

@freezed
abstract class AdminTrackingState with _$AdminTrackingState{
  factory AdminTrackingState({
    @Default(false) bool success,
    @Default('') String message,
    @Default(TrackItemEntity()) TrackItemEntity data,
    @Default(TrackingStatus.initial) TrackingStatus status,
  }) = _AdminTrackingState;
}
