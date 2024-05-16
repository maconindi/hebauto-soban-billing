
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/api/dio_client.dart';
import '../../../../core/network/api/list_api.dart';
import '../../domain/entities/signin_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../models/signin_model.dart';

abstract class LoginRemoteDataSource {
  Future <Either<Failure, SignInEntity>> login(LoginParams loginParams);
}


@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDatasourceImpl implements LoginRemoteDataSource {

  final DioClient _client;

  LoginRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, SignInEntity>> login(LoginParams loginParams) async {
    final response = await _client.postRequest(
      ListAPI.login,
      data: loginParams.toJson(),
      converter: (response) {
        return  SignInModel.fromJson(response);
      },
    );
    return response;
  }

}