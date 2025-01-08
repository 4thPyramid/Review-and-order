import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../../home/domain/repository/home_repository.dart';
import '../../data/model/profile_model.dart';

class UpdateProfilePhoto {
  final IHomeRepository _romeRepository;
  const UpdateProfilePhoto(this._romeRepository);

  Future<Either<ErrorModel, ProfileModel>> call(File? file) {
    return _romeRepository.updateProfleImage(file);
  }
}
