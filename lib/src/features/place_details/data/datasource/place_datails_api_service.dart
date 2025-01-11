import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:review_app/core/data/api/api_consumer.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/core/errors/exceptions.dart';
import 'package:review_app/src/features/place_details/data/models/favorite_place.dart';
import 'package:review_app/src/features/place_details/data/models/place_details_model.dart';

abstract class IPlaceDetailsApiService {
  Future<Either<ErrorModel, PlaceDetailsModel>> getPlaceDetails(int placeId);
  Future<Either<ErrorModel, FavoritePlaceModel>> addToFavorites(int placeId);
  Future<Either<ErrorModel, String>> addCommit(
      int placeId, String content, File image);
  Future<Either<ErrorModel, String>> addRate(int placeId, int rate);
}

class PlaceDetailsApiServiceImpl implements IPlaceDetailsApiService {
  final ApiConsumer _api;
  PlaceDetailsApiServiceImpl(this._api);
  @override
  Future<Either<ErrorModel, PlaceDetailsModel>> getPlaceDetails(
      int placeId) async {
    try {
      final response = await _api.get('place/$placeId');
      final place = PlaceDetailsModel.fromJson(response);
      return Right(place);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, FavoritePlaceModel>> addToFavorites(
      int placeId) async {
    try {
      final response = await _api.post('favorites/$placeId/toggle');

      final favoritePlace = FavoritePlaceModel.fromJson(response);
      return Right(favoritePlace);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> addCommit(
      int placeId, String content, File? image) async {
    try {
      if (image == null) {
        return Left(ErrorModel(message: "File is null"));
      }

      final formData = FormData.fromMap({
        'content': content,
        'image': await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        ),
      });
      final response = await _api.post(
        'place/$placeId/store-review',
        data: formData,
      );
      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, String>> addRate(int placeId, int rate) async {
    try {
      final response = await _api.post('place/$placeId/rate', data: {
        'rating': rate,
      });
      return Right(response['message']);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
