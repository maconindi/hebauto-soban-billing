import 'package:dartz/dartz.dart';
import 'package:hebauto/core/network/api/dio_client.dart';
import 'package:hebauto/features_customer/signin/domain/entity/signin_entity_customer.dart';
import 'package:hebauto/injection.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/services/hive/main_box.dart';

import '../../domain/repository/login_repository.dart';
import '../../domain/usecase/login_usecase.dart';
import '../datasources/login_remote_datasource.dart';

@Injectable(as: LoginRepositoryCustomer)
class LoginRepositoryImpl extends LoginRepositoryCustomer {
  final LoginRemoteDataSource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;

  LoginRepositoryImpl(this.authRemoteDatasource, this.mainBoxMixin);

  @override
  Future<Either<Failure, SignInEntityCustomer>> login(LoginParams loginParams) async {
    final response = await authRemoteDatasource.login(loginParams);
    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        mainBoxMixin.addData(MainBoxKeys.isLogin, true);
        mainBoxMixin.addData(MainBoxKeys.email, loginResponse.user?.email ?? '');
        mainBoxMixin.addData(MainBoxKeys.name, loginResponse.user?.name ?? '');
        mainBoxMixin.addData(MainBoxKeys.token, loginResponse.accessToken);
        mainBoxMixin.addData(MainBoxKeys.isAdmin, false);
        getIt<DioClient>().dio.options.headers['Authorization'] =
            'Bearer ${MainBoxMixin.mainBox?.get(MainBoxKeys.token.name)}';

        return Right(loginResponse);
      },
    );
  }
}
