
import 'package:equatable/equatable.dart';
import 'package:hebauto/features_customer/tracking/domain/usecase/track_inventory_usecase.dart';
import 'package:meta/meta.dart';



@immutable
abstract class TrackEventX extends Equatable {

  @override
  List<Object> get props => [];
}

class TrackingCarEvent extends TrackEventX {
  TrackingCarEvent({required this.params});

  final TrackingParams params;

  @override
  List<Object> get props => [params];

}
