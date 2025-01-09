import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/datasource/home_remote_ds.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/home/data/models/update_location_response_model.dart';
import 'package:review_app/src/features/profile/data/model/profile_model.dart';

abstract class IHomeRepository {
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces(
    double lat,
    double lng,
  );
  Future<Either<ErrorModel, List<PlaceModel>>> getAllPlaces();
  Future<Either<ErrorModel, UpdateLocationResponse>> updateLocation(
    double lat,
    double lng,
  );
  Future<Either<ErrorModel, ProfileModel>> getProfile();
  Future<Either<ErrorModel, ProfileModel>> updateProfle(
    String name,
    String phone,
    String email,
  );
  Future<Either<ErrorModel, ProfileModel>> updateProfleImage(File? file);
}

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeRemoteDs _homeRemoteDs;

  HomeRepositoryImpl(this._homeRemoteDs);

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces() {
    return _homeRemoteDs.getNewPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces() {
    return _homeRemoteDs.getTopRatedPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getAllPlaces() async {
    return _homeRemoteDs.getAllPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces(
    double lat,
    double lng,
  ) {
    return _homeRemoteDs.getNearstPlaces(
      lat,
      lng,
    );
  }

  @override
  Future<Either<ErrorModel, ProfileModel>> getProfile() {
    return _homeRemoteDs.getProfile();
  }

  @override
  Future<Either<ErrorModel, ProfileModel>> updateProfle(
      String name, String phone, String email) {
    return _homeRemoteDs.updateProfle(name, phone, email);
  }

  @override
  Future<Either<ErrorModel, ProfileModel>> updateProfleImage(File? file) {
    return _homeRemoteDs.updateProfleImage(file);
  }

  @override
  Future<Either<ErrorModel, UpdateLocationResponse>> updateLocation(
      double lat, double lng) {
    return _homeRemoteDs.updateLocation(lat, lng);
  }
}
