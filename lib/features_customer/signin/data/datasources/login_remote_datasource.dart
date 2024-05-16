
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/api/dio_client.dart';
import '../../../../core/network/api/list_api.dart';
import '../../domain/entity/signin_entity_customer.dart';
import '../../domain/usecase/login_usecase.dart';
import '../models/signin_model.dart';

abstract class LoginRemoteDataSource {
  Future <Either<Failure, SignInEntityCustomer>> login(LoginParams loginParams);
}


@Injectable(as: LoginRemoteDataSource)
class LoginRemoteDatasourceImpl implements LoginRemoteDataSource {

  LoginRemoteDatasourceImpl(this._client);

  final DioClient _client;

  @override
  Future<Either<Failure, SignInEntityCustomer>> login(LoginParams loginParams) async {
    final response = await _client.postRequest(
      ListAPI.loginCustomer,
      data: loginParams.toJson(),
      converter: (response) {
        return  SignInModel.fromJson(response);
      },
    );
    return response;
  }

}