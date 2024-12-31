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
}
