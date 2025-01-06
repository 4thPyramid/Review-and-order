import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/datasource/auth_remote_ds.dart';
import '../../data/model/auth_response.dart';
import '../../data/model/register_request.dart';

abstract class IAuthRepository {
  Future<Either<ErrorModel, AuthResponse>> login(
    String email,
    String password,
  );
  Future<Either<ErrorModel, AuthResponse>> register(
      RegisterAuthData registerAuthData);
        Future<Either<ErrorModel, String>> forgetPassword(String email);
 Future<Either<ErrorModel, String>> verifyCode(String email, String code);
  Future<Either<ErrorModel, String>> resetPassword(String email, String code, String password);
}

class AuthRepositoryImpl implements IAuthRepository {
  final IAuthRemoteDs _remoteDs;

  AuthRepositoryImpl(this._remoteDs);
  @override
  Future<Either<ErrorModel, AuthResponse>> login(
      String email, String password) {
    return _remoteDs.login(email, password);
  }

  @override
  Future<Either<ErrorModel, AuthResponse>> register(
      RegisterAuthData registerAuthData) {
    return _remoteDs.register(registerAuthData);
  }
  
  @override
  Future<Either<ErrorModel, String>> forgetPassword(String email) {
   return _remoteDs.forgetPassword(email);
  }
  
  @override
  Future<Either<ErrorModel, String>> verifyCode(String email, String code) {
   return _remoteDs.verifyCode(email, code);
  }
  
  @override
  Future<Either<ErrorModel, String>> resetPassword(String email, String code, String password) {
  return _remoteDs.resetPassword(email, code, password);
  }
}
