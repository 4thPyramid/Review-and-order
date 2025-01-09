import 'package:dartz/dartz.dart';
import 'package:review_app/core/data/api/api_consumer.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/core/errors/exceptions.dart';
import 'package:review_app/src/features/place_details/data/models/favorite_place.dart';
import 'package:review_app/src/features/place_details/data/models/place_details_model.dart';

abstract class IPlaceDetailsApiService {
  Future<Either<ErrorModel, PlaceDetailsModel>> getPlaceDetails(int placeId);
  Future<Either<ErrorModel, FavoritePlaceModel>> addToFavorites(int placeId);
  // Future<Either<ErrorModel, String>> addCommit(
  //     int placeId , String comment ,  );
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
}
