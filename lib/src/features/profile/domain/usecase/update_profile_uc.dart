import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/profile/data/model/profile_model.dart';

import '../repository/profile_repository.dart';

class UpdateProfileUc {
  final ProfileRepository _profileRepository;

  UpdateProfileUc(this._profileRepository);

  Future<Either<ErrorModel, ProfileModel>> call(
    String name,
    String phone,
    String email,
  ) {
    return _profileRepository.updateProfile(name, phone, email);
  }
}
