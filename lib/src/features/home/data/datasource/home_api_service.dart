import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:review_app/core/data/api/api_consumer.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/core/errors/exceptions.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/profile/data/model/profile_model.dart';

abstract class HomeApiService {
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getAllPlaces();
  Future<Either<ErrorModel, ProfileModel>> getProfile();
  Future<Either<ErrorModel, ProfileModel>> updateProfle(
    String? name,
    String? phone,
    String? email,
  );
  Future<Either<ErrorModel, ProfileModel>> updateProfleImage(
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

  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces() async {
    try {
      final response = await _api.get('nearby-places');
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
  Future<Either<ErrorModel, ProfileModel>> updateProfleImage(File? file) async {
    try {
      final response = await _api.post('update-profile', data: {
        'image': file,
      });
      final profile = ProfileModel.fromJson(response);
      return Right(profile);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
