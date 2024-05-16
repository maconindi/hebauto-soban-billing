import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/signin_entity_customer.dart';
import '../repository/login_repository.dart';

part 'login_usecase.freezed.dart';
part 'login_usecase.g.dart';

@injectable
class LoginUseCase extends UseCase<SignInEntityCustomer, LoginParams> {

  LoginUseCase(this.repository);
  final LoginRepositoryCustomer repository;

  @override
  Future<Either<Failure, SignInEntityCustomer>> call(LoginParams params) => repository.login(params);
  
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    @Default('') String email,
    @Default('') String password,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
