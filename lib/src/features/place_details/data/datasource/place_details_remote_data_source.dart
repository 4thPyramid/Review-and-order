import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/place_details/data/datasource/place_datails_api_service.dart';
import 'package:review_app/src/features/place_details/data/models/one_place_model.dart';

abstract class IPlaceDetailsDS {
  Future<Either<ErrorModel, OnePlaceModel>> getPlaceDetails(int placeId);
}

class PlaceDetailsDSImpl implements IPlaceDetailsDS {
  final IPlaceDetailsApiService apiService;

  PlaceDetailsDSImpl(this.apiService);
  @override
  Future<Either<ErrorModel, OnePlaceModel>> getPlaceDetails(int placeId) {
    return apiService.getPlaceDetails(placeId);
  }
}
