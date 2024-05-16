import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/signin_entity.dart';
import '../repositories/login_repository.dart';

part 'login_usecase.freezed.dart';
part 'login_usecase.g.dart';

@injectable
class LoginUseCase extends UseCase<SignInEntity, LoginParams> {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, SignInEntity>> call(LoginParams params) => repository.login(params);
  
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
