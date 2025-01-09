import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:review_app/core/data/api/api_consumer.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/core/errors/exceptions.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/home/data/models/update_location_response_model.dart';
import 'package:review_app/src/features/profile/data/model/profile_model.dart';

abstract class HomeApiService {
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces(
    double lat,
    double lng,
  );
  Future<Either<ErrorModel, List<PlaceModel>>> getAllPlaces();
  Future<Either<ErrorModel, ProfileModel>> getProfile();
  Future<Either<ErrorModel, UpdateLocationResponse>> updateLocation(
    double lat,
    double lng,
  );
  Future<Either<ErrorModel, ProfileModel>> updateProfle(
    String? name,
    String? phone,
    String? email,
  );
  Future<Either<ErrorModel, ProfileModel>> updateProfileImage(
    File? file,
  );
}

class HomeApiServiceImpl implements HomeApiService {
  final ApiConsumer _api;

  HomeApiServiceImpl(this._api);
  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces() async {
    try {
      final response = await _api.get('top-rated-places');
      final places = List<PlaceModel>.from(
        response.map((x) => PlaceModel.fromJson(x)),
      );
      return Right(places);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces() async {
    try {
      final response = await _api.get('new-places');
      final places = List<PlaceModel>.from(
        response.map((x) => PlaceModel.fromJson(x)),
      );
      return Right(places);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces(
    double lat,
    double lng,
  ) async {
    try {
      final response = await _api.post('nearby-places', data: {
        "lat": lat,
        "lng": lng,
      });
      final places = List<PlaceModel>.from(
        response.map((x) => PlaceModel.fromJson(x)),
      );
      return Right(places);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getAllPlaces() async {
    try {
      final response = await _api.get('all-places');
      final places = List<PlaceModel>.from(
        response.map((x) => PlaceModel.fromJson(x)),
      );
      return Right(places);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  Future<Either<ErrorModel, UpdateLocationResponse>> updateLocation(
      double latitude, double longitude) async {
    try {
      final response = await _api.post('store-location', data: {
        'latitude': latitude,
        'longitude': longitude,
      });
      final updateLocationResponse = UpdateLocationResponse.fromJson(response);
      return Right(updateLocationResponse);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

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
  Future<Either<ErrorModel, ProfileModel>> updateProfle(
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
