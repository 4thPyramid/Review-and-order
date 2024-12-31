import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/auth/data/model/auth_response.dart';
import 'package:dartz/dartz.dart';
import 'package:review_app/src/features/auth/data/model/register_request.dart';

import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/data/cached/cache_helper.dart';
import '../../../../../core/errors/exceptions.dart';

abstract class AuthApiServices {
  Future<Either<ErrorModel, AuthResponse>> login(String email, String password);
  Future<Either<ErrorModel, AuthResponse>> register(
      RegisterAuthData registerAuthData);
}

class AuthApiServicesImpl extends AuthApiServices {
  final ApiConsumer api;
  AuthApiServicesImpl(this.api);
  @override
  Future<Either<ErrorModel, AuthResponse>> login(
      String email, String password) async {
    try {
      final response = await api.post(
        'login',
        data: {
          'email': email,
          'password': password,
        },
        isFormData: true,
      );
      final userResponse = AuthResponse.fromJson(response);
      CacheHelper.saveToken(value: userResponse.token);
      CacheHelper.saveData(key: 'name', value: userResponse.user.name);
      CacheHelper.saveData(key: 'email', value: userResponse.user.email);

      return Right(userResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, AuthResponse>> register(
      RegisterAuthData registerAuthData) async {
    try {
      final response = await api.post(
        'register',
        data: registerAuthData.toJson(),
        isFormData: true,
      );
      final userResponse = AuthResponse.fromJson(response);
      CacheHelper.saveToken(value: userResponse.token);
      CacheHelper.saveData(key: 'name', value: userResponse.user.name);
      CacheHelper.saveData(key: 'email', value: userResponse.user.email);

      return Right(userResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
