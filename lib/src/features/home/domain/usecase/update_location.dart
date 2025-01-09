import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/models/update_location_response_model.dart';
import 'package:review_app/src/features/home/domain/repository/home_repository.dart';

class UpdateLocationUC {
  final IHomeRepository repository;
  UpdateLocationUC(this.repository);
  Future<Either<ErrorModel, UpdateLocationResponse>> call(
          double lat, double lng) =>
      repository.updateLocation(lat, lng);
}
