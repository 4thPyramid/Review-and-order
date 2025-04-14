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
  Future<Either<ErrorModel, UpdateLocationResponse>> updateLocation(
    double lat,
    double lng,
  );
}

class HomeApiServiceImpl implements HomeApiService {
  final ApiConsumer _api;

  HomeApiServiceImpl(this._api);
  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces() async {
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

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces() async {
    try {
      final response = await _api.get('top-rated-places');
      final places = List<PlaceModel>.from(
        response.map((x) => PlaceModel.fromJson(x)),
      );
      print('----------------------------------');
      print('----------------------------------');
      print('response: $response');
      return Right(places);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
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
      print('----------------------------------');
      print('----------------------------------');

      print('response: $response');
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
}
