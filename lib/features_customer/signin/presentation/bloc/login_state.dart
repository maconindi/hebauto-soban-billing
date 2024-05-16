import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entity/signin_entity_customer.dart';

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
     @Default(SignInEntityCustomer()) SignInEntityCustomer signInEntity,
     @Default(LoginStatus.initial) LoginStatus authStatus,
}) = _LoginState;
}



