
import '../../domain/entities/signin_entity.dart';

class SignInModel extends SignInEntity {
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
      user: json['user'] != null ? AdminDataModel.fromJson(json['user']) : const AdminDataModel(),
    );
  }
}

class AdminDataModel extends UserData {
   const AdminDataModel({
     super.id,
     super.name,
     super.email,
  });

  factory AdminDataModel.fromJson(Map<String, dynamic> json) {
    return AdminDataModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
