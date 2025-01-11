import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/profile_model.dart';
import '../repository/profile_repository.dart';

class UpdateProfilePhoto {
  final ProfileRepository _profileRepository;
  const UpdateProfilePhoto(this._profileRepository);

  Future<Either<ErrorModel, ProfileModel>> call(File? file) {
    return _profileRepository.updateProfileImage(file);
  }
}
