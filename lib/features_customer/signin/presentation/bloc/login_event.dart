

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';




@immutable
abstract class AuthEventX extends Equatable {

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEventX {
  LoginEvent({required this.email, required this.password});

  String email;
  String password;

  @override
  List<Object> get props => [email, password];

}

