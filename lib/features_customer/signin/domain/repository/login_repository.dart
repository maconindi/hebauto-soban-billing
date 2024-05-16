
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/signin_entity_customer.dart';
import '../usecase/login_usecase.dart';

abstract class LoginRepositoryCustomer {
  Future <Either<Failure, SignInEntityCustomer>> login(LoginParams loginParams);
}
