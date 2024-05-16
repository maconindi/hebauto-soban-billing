import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
    final bool status;
    final String? accessToken;
    final String? message;
    final int? expiresAt;
    final UserData? user;
    const SignInEntity({
        this.status = false,
        this.accessToken = '',
        this.message = '',
        this.expiresAt = 0,
        this.user = const UserData(),
    });
    @override
    List<Object?> get props => [accessToken, expiresAt, user];
}

class UserData extends Equatable {
    final int id;
    final String name;
    final String email;
    final String phone;
    //
    // final String tradingLicense;
    // final String companyName;
    // final String updatedAt;
    // final String createdAt;

    const UserData({
        this.id = 0,
        this.name = '',
        this.email = '',
        this.phone = '',

        // this.tradingLicense = '',
        // this.companyName = '',
        // this.updatedAt = '',
        // this.createdAt = '',
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
