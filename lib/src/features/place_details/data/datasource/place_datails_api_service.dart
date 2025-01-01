import 'package:dartz/dartz.dart';
import 'package:review_app/core/data/api/api_consumer.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/core/errors/exceptions.dart';
import 'package:review_app/src/features/place_details/data/models/one_place_model.dart';

abstract class IPlaceDetailsApiService {
  Future<Either<ErrorModel, OnePlaceModel>> getPlaceDetails(int placeId);
}

class PlaceDetailsApiServiceImpl implements IPlaceDetailsApiService {
  final ApiConsumer _api;
  PlaceDetailsApiServiceImpl(this._api);
  @override
  Future<Either<ErrorModel, OnePlaceModel>> getPlaceDetails(int placeId) async {
    try {
      final response = await _api.get('place/$placeId');
      final place = OnePlaceModel.fromJson(response);
      return Right(place);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
