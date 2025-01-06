import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/intro/data/onbording_model.dart';
import 'package:review_app/src/features/place_details/data/datasource/place_details_remote_data_source.dart';
import 'package:review_app/src/features/place_details/data/models/favorite_place.dart';
import 'package:review_app/src/features/place_details/data/models/place_details_model.dart';

abstract class IPlaceDetailsRepository {
  Future<Either<ErrorModel, PlaceDetailsModel>> getPlaceDetails(int placeId);
  Future<Either<ErrorModel, FavoritePlaceModel>> addToFavorites(int placeId);
}

class PlaceDetailsRepositoryImpl implements IPlaceDetailsRepository {
  final IPlaceDetailsDS _detailsDS;

  PlaceDetailsRepositoryImpl(this._detailsDS);

  @override
  Future<Either<ErrorModel, PlaceDetailsModel>> getPlaceDetails(int placeId) {
    return _detailsDS.getPlaceDetails(placeId);
  }

  @override
  Future<Either<ErrorModel, FavoritePlaceModel>> addToFavorites(int placeId) {
    return _detailsDS.addToFavorites(placeId);
  }
}
