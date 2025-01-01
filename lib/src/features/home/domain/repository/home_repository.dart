import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/datasource/home_remote_ds.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';

abstract class IHomeRepository {
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces();
  Future<Either<ErrorModel, List<PlaceModel>>> getAllPlaces();
}

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeRemoteDs _homeRemoteDs;

  HomeRepositoryImpl(this._homeRemoteDs);

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getNewPlaces() {
    return _homeRemoteDs.getNewPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getTopRatedPlaces() {
    return _homeRemoteDs.getTopRatedPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getAllPlaces() async {
    return _homeRemoteDs.getAllPlaces();
  }

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getNearstPlaces() {
    return _homeRemoteDs.getNearstPlaces();
  }
}
