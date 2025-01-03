import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/datasource/home_api_service.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';

abstract class IHomeRemoteDs {
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getAllPlaces();
}

class HomeRemoteDsImpl implements IHomeRemoteDs {
  final HomeApiService _homeApiService;
  HomeRemoteDsImpl(this._homeApiService);
  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces() {
    return _homeApiService.getNewPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces() {
    return _homeApiService.getTopRatedPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getAllPlaces() {
    return _homeApiService.getAllPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces() {
    return _homeApiService.getNearstPlaces();
  }
}
