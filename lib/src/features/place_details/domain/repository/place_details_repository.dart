import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/intro/data/onbording_model.dart';
import 'package:review_app/src/features/place_details/data/datasource/place_details_remote_data_source.dart';
import 'package:review_app/src/features/place_details/data/models/one_place_model.dart';

abstract class IPlaceDetailsRepository {
  Future<Either<ErrorModel, OnePlaceModel>> getPlaceDetails(int placeId);
}

class PlaceDetailsRepositoryImpl implements IPlaceDetailsRepository {
  final IPlaceDetailsDS _detailsDS;

  PlaceDetailsRepositoryImpl(this._detailsDS);

  @override
  Future<Either<ErrorModel, OnePlaceModel>> getPlaceDetails(int placeId) {
    return _detailsDS.getPlaceDetails(placeId);
  }
}
