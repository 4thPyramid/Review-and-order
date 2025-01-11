import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/profile/data/model/profile_model.dart';

import '../repository/profile_repository.dart';

class GetProfileDataUC {
  final ProfileRepository _profileRepository;

  GetProfileDataUC(this._profileRepository);

  Future<Either<ErrorModel, ProfileModel>> call() {
    return _profileRepository.getProfile();
  }
}
