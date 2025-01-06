import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../repository/auth_repository.dart';

class ForgetPasswordUseCase {
  final IAuthRepository repository;

  ForgetPasswordUseCase(this.repository);

  Future<Either<ErrorModel, String>> call(String email) async {
    return repository.forgetPassword(email);
  }
}

class VerifyCodeUseCase{
  final IAuthRepository repository;

  VerifyCodeUseCase(this.repository);

  Future<Either<ErrorModel, String>> call(String email, String code) async {
    return repository.verifyCode(email, code);
  }
}


class ResetPasswordUseCase{
  final IAuthRepository repository;

  ResetPasswordUseCase(this.repository);

  Future<Either<ErrorModel, String>> call(String email, String code, String password) async {
    return repository.resetPassword(email, code, password);
  }
}