import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/home/domain/repository/home_repository.dart';

class GetNewPlacesUC {
  final IHomeRepository repository;
  GetNewPlacesUC(this.repository);
  Future<Either<ErrorModel, List<PlaceModel>>> call() async {
    return await repository.getNewPlaces();
  }
}
