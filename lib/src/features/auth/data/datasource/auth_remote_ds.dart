import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/auth_response.dart';
import '../model/register_request.dart';
import 'auth_api_services.dart';

abstract class IAuthRemoteDs {
  Future<Either<ErrorModel, AuthResponse>> login(String email, String password);

  Future<Either<ErrorModel, AuthResponse>> register(
      RegisterAuthData registerAuthData);
}

class AuthRemoteDsImpl implements IAuthRemoteDs {
  final AuthApiServices _apiServices;

  AuthRemoteDsImpl(this._apiServices);
  @override
  Future<Either<ErrorModel, AuthResponse>> login(
      String email, String password) {
    return _apiServices.login(email, password);
  }

  @override
  Future<Either<ErrorModel, AuthResponse>> register(
      RegisterAuthData registerAuthData) {
    return _apiServices.register(registerAuthData);
  }
}
