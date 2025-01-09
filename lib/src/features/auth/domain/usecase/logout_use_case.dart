import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../repository/auth_repository.dart';

class LogoutUseCase {
  final IAuthRepository repository;

  LogoutUseCase(this.repository);

  Future<Either<ErrorModel, String>> call() async {
    return await repository.logout();
  }
}
