import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';
import '../model/profile_model.dart';

abstract class ProfileApiService {
  Future<Either<ErrorModel, ProfileModel>> getProfile();
 
  Future<Either<ErrorModel, ProfileModel>> updateProfile(
    String? name,
    String? phone,
    String? email,
  );
  Future<Either<ErrorModel, ProfileModel>> updateProfileImage(
    File? file,
  );
}


class ProfileApiServiceImpl implements ProfileApiService {
  final ApiConsumer _api;

  ProfileApiServiceImpl(this._api);

  @override
  Future<Either<ErrorModel, ProfileModel>> getProfile() async {
    try {
      final response = await _api.get(
        'profile',
      );
      final profile = ProfileModel.fromJson(response);
      return Right(profile);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, ProfileModel>> updateProfile(
    String? name,
    String? phone,
    String? email,
  ) async {
    try {
      final response = await _api.post('update-profile', data: {
        'name': name,
        'phone': phone,
        'email': email,
      });
      final profile = ProfileModel.fromJson(response);
      return Right(profile);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, ProfileModel>> updateProfileImage(File? file) async {
    try {
      if (file == null) {
        return Left(ErrorModel(message: "File is null"));
      }

      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });

      final response = await _api.post(
        'update-profile',
        data: formData,
        headers: {
          'Content-Type': 'multipart/form-data',
        },
      );

      final profile = ProfileModel.fromJson(response);
      return Right(profile);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    } catch (e) {
      return Left(ErrorModel(message: e.toString()));
    }
  }

}