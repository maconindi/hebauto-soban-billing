import 'package:equatable/equatable.dart';

class SignInEntityCustomer extends Equatable {
  final bool status;
  final String? accessToken;
  final String? message;
  final int? expiresAt;
  final DataCustomer? user;
  const SignInEntityCustomer({
    this.status = false,
    this.accessToken = '',
    this.message = '',
    this.expiresAt = 0,
    this.user = const DataCustomer(),
  });
  @override
  List<Object?> get props => [accessToken, expiresAt, user];
}

class DataCustomer extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;

  const DataCustomer({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.phone = '',
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    // tradingLicense,
    // companyName,
    // updatedAt,
    // createdAt,
  ];
}
