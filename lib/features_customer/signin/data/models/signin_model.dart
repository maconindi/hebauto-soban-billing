

import '../../domain/entity/signin_entity_customer.dart';

class SignInModel extends SignInEntityCustomer {
  const SignInModel(
      {required super.status,
      required super.accessToken,
      required super.message,
      required super.expiresAt,
      required super.user});

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      status: json['status'] ?? false,
      accessToken: json['accessToken'] ?? '',
      expiresAt: json['expiresAt'] ?? 0,
      message: json['message'] ?? '',
      user: json['user'] != null ? CustomerDataModel.fromJson(json['user']) : const CustomerDataModel(),
    );
  }
}

class CustomerDataModel extends DataCustomer {
   const CustomerDataModel({
     super.id,
     super.name,
     super.email,
  });

  factory CustomerDataModel.fromJson(Map<String, dynamic> json) {
    return CustomerDataModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
