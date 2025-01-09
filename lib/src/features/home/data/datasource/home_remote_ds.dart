import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/datasource/home_api_service.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/home/data/models/update_location_response_model.dart';
import 'package:review_app/src/features/profile/data/model/profile_model.dart';

abstract class IHomeRemoteDs {
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces(
    double lat,
    double lng,
  );
  Future<Either<ErrorModel, List<PlaceModel>>> getAllPlaces();
  Future<Either<ErrorModel, UpdateLocationResponse>> updateLocation(
      double lat, double lng);
  Future<Either<ErrorModel, ProfileModel>> getProfile();
  Future<Either<ErrorModel, ProfileModel>> updateProfle(
    String name,
    String phone,
    String email,
  );
  Future<Either<ErrorModel, ProfileModel>> updateProfleImage(File? file);
}

class HomeRemoteDsImpl implements IHomeRemoteDs {
  final HomeApiService _homeApiService;
  HomeRemoteDsImpl(this._homeApiService);
  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces() {
    return _homeApiService.getNewPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces() {
    return _homeApiService.getTopRatedPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getAllPlaces() {
    return _homeApiService.getAllPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces(
    double lat,
    double lng,
  ) {
    return _homeApiService.getNearstPlaces(
      lat,
      lng,
    );
  }

  @override
  Future<Either<ErrorModel, ProfileModel>> getProfile() {
    return _homeApiService.getProfile();
  }

  @override
  Future<Either<ErrorModel, ProfileModel>> updateProfle(
      String name, String phone, String email) {
    return _homeApiService.updateProfle(name, phone, email);
  }

  @override
  Future<Either<ErrorModel, ProfileModel>> updateProfleImage(File? file) {
    return _homeApiService.updateProfileImage(file);
  }

  @override
  Future<Either<ErrorModel, UpdateLocationResponse>> updateLocation(
      double lat, double lng) {
    return _homeApiService.updateLocation(lat, lng);
  }
}
