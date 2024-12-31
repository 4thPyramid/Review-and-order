import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/auth_response.dart';
import '../../data/model/register_request.dart';
import '../repository/auth_repository.dart';

class RegisterUseCase {
  final IAuthRepository _repository;

  RegisterUseCase(this._repository);

  Future<Either<ErrorModel, AuthResponse>> call(
      RegisterAuthData registerAuthData) async {
    return _repository.register(registerAuthData);
  }
}
