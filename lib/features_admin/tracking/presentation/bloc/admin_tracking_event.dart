
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/track_inventory_usecase.dart';



@immutable
abstract class TrackEventX extends Equatable {

  @override
  List<Object> get props => [];
}

class TrackingCarEvent extends TrackEventX {

  final AdminTrackingParams params;
  TrackingCarEvent({required this.params});

  @override
  List<Object> get props => [params];

}
