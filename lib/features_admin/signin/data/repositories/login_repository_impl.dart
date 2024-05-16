import 'package:dartz/dartz.dart';
import 'package:hebauto/core/network/api/dio_client.dart';
import 'package:hebauto/injection.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/services/hive/main_box.dart';

import '../../domain/entities/signin_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../datasources/login_remote_datasource.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;

  LoginRepositoryImpl(this.authRemoteDatasource, this.mainBoxMixin);

  @override
  Future<Either<Failure, SignInEntity>> login(LoginParams loginParams) async {
    final response = await authRemoteDatasource.login(loginParams);
    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        mainBoxMixin.addData(MainBoxKeys.isLogin, true);
        mainBoxMixin.addData(MainBoxKeys.email, loginResponse.user?.email);
        mainBoxMixin.addData(MainBoxKeys.token, loginResponse.accessToken);
        mainBoxMixin.addData(MainBoxKeys.isAdmin, true);
        getIt<DioClient>().dio.options.headers['Authorization'] =
            'Bearer ${MainBoxMixin.mainBox?.get(MainBoxKeys.token.name)}';

        return Right(loginResponse);
      },
    );
  }
}
