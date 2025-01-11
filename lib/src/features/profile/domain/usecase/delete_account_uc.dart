import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../repository/profile_repository.dart';

class DeleteAccountUC {
  final ProfileRepository _profileRepository;

  DeleteAccountUC(this._profileRepository);

  Future<Either<ErrorModel, String>> call() {
    return _profileRepository.deleteAccount();
  }
}
