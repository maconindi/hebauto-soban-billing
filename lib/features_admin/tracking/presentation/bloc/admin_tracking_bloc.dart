
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/failure.dart';
import 'package:injectable/injectable.dart';


import '../../domain/usecase/track_inventory_usecase.dart';
import 'admin_tracking_event.dart';
import 'admin_tracking_state.dart';


@injectable
class AdminTrackingBloc extends Bloc<TrackEventX, AdminTrackingState> {
  final TrackInventoryUsecase usecase;
  AdminTrackingBloc(this.usecase) : super(AdminTrackingState()) {
    on<TrackingCarEvent>(_trackCarEvent);
  }


  Future<void> _trackCarEvent(TrackingCarEvent event, Emitter<AdminTrackingState> emit) async {

    emit(state.copyWith(status: TrackingStatus.loading));
    try {

      final response = await usecase.call(event.params);
      response.fold((error) {
        emit(
          state.copyWith(
              success: false,
              status: TrackingStatus.error,
              message: error.getErrorMessage()
          ),
        );
      }, (res) {

        if(res.inventId.isNotEmpty){
          emit(state.copyWith(
              success: true,
              status: TrackingStatus.success, data: res));
        }else{
          emit(state.copyWith(
              success: false,
              message: 'No record found against this vin/lot number!',
              status: TrackingStatus.error));
        }

        // if (res.status == false) {
        //   emit(state.copyWith(status: TrackingStatus.authError, message: res.message ?? ''));
        // } else {
        //   emit(state.copyWith(status: TrackingStatus.success, ),);
        // }
      }
      );
    } catch (exception) {
      emit(state.copyWith(status: TrackingStatus.error, message: exception.toString()));
    }
  }
}

