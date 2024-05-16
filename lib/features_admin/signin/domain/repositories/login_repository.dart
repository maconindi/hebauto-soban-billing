import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/signin_entity.dart';
import '../usecases/login_usecase.dart';


abstract class LoginRepository {
  Future <Either<Failure, SignInEntity>> login(LoginParams loginParams);
}
