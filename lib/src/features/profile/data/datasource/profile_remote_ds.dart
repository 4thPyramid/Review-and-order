import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/profile_model.dart';
import 'profile_api_service.dart';

abstract class ProfileRemoteDs {
  Future<Either<ErrorModel, ProfileModel>> getProfile();

  Future<Either<ErrorModel, ProfileModel>> updateProfile(
    String? name,
    String? phone,
    String? email,
  );
  Future<Either<ErrorModel, ProfileModel>> updateProfileImage(
    File? file,
  );
    Future<Either<ErrorModel, String>> deleteAccount();

}

class ProfileRemoteDSImpl implements ProfileRemoteDs {
  final ProfileApiService _profileApiService;
  ProfileRemoteDSImpl(this._profileApiService);

  @override
  Future<Either<ErrorModel, ProfileModel>> getProfile() {
    return _profileApiService.getProfile();
  }

  @override
  Future<Either<ErrorModel, ProfileModel>> updateProfileImage(File? file) {
    return _profileApiService.updateProfileImage(file);
  }

  @override
  Future<Either<ErrorModel, ProfileModel>> updateProfile(
      String? name, String? phone, String? email) {
    return _profileApiService.updateProfile(name, phone, email);
  }
  
  @override
  Future<Either<ErrorModel, String>> deleteAccount() {
    return _profileApiService.deleteAccount();
  }
  
}
