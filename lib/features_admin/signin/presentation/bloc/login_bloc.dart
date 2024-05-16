
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hebauto/core/util/ext/failure.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/login_usecase.dart';

import 'login_event.dart';
import 'login_state.dart';

@injectable
class AdminLoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase uLogin;

  AdminLoginBloc(this.uLogin) : super(LoginState()) {
    on<LoginEvent>(_onLoginEvent);
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(authStatus: LoginStatus.loading));
    try {
      final response = await uLogin.repository
          .login(LoginParams(email: event.email, password: event.password));
      response.fold((error) {
        emit(
          state.copyWith(
            authStatus: LoginStatus.error,
            message: error.getErrorMessage()
          ),
        );
      }, (res) {

        if (res.status == false) {
          emit(state.copyWith(authStatus: LoginStatus.authError, message: res.message ?? ''));
        } else {
          emit(state.copyWith(authStatus: LoginStatus.success, ),);
        }

      }
      );
    } catch (exception) {
      emit(state.copyWith(authStatus: LoginStatus.error, message: exception.toString()));
    }
  }
}
