import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/auth_response.dart';
import '../model/register_request.dart';
import 'auth_api_services.dart';

abstract class IAuthRemoteDs {
  Future<Either<ErrorModel, AuthResponse>> login(String email, String password);

  Future<Either<ErrorModel, AuthResponse>> register(
      RegisterAuthData registerAuthData);
        Future<Either<ErrorModel, String>> forgetPassword(String email);
 Future<Either<ErrorModel, String>> verifyCode(String email, String code);
  Future<Either<ErrorModel, String>> resetPassword(String email, String code, String password);
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
  
  @override
  Future<Either<ErrorModel, String>> forgetPassword(String email) {
    return _apiServices.forgetPassword(email);
  }
  
  @override
  Future<Either<ErrorModel, String>> verifyCode(String email, String code) {
   return _apiServices.verifyCode(email, code);
  }
  
  @override
  Future<Either<ErrorModel, String>> resetPassword(String email, String code, String password) {
   return _apiServices.resetPassword(email, code, password);
  }
}
