import 'package:dartz/dartz.dart';
import 'package:review_app/core/data/api/api_consumer.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/core/errors/exceptions.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';

abstract class HomeApiService {
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces();
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
}
