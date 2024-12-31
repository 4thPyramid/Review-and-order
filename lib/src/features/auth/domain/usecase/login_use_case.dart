import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/auth_response.dart';
import '../repository/auth_repository.dart';

class LoginUseCase {
  final IAuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<Either<ErrorModel, AuthResponse>> call(
      String email, String password) async {
    return _authRepository.login(email, password);
  }
}
