import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/signin_entity.dart';

part 'login_state.freezed.dart';


enum LoginStatus { initial, success, error, loading , authError}

extension LoginStatusX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;
  bool get isSuccess => this == LoginStatus.success;
  bool get isError => this == LoginStatus.error;
  bool get isAuthError => this == LoginStatus.authError;
  bool get isLoading => this == LoginStatus.loading;
}


@freezed
abstract class LoginState with _$LoginState {
   factory LoginState({
     @Default(false) bool success,
     @Default('') String message,
     @Default(SignInEntity()) SignInEntity signInEntity,
     @Default(LoginStatus.initial) LoginStatus authStatus,
}) = _LoginState;
}



