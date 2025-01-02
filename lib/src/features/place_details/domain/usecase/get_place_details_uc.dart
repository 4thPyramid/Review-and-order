import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/place_details/data/models/place_details_model.dart';
import 'package:review_app/src/features/place_details/domain/repository/place_details_repository.dart';

class GetPlaceDetailsUc {
  final IPlaceDetailsRepository _placeDetailsRepository;

  GetPlaceDetailsUc(this._placeDetailsRepository);

  Future<Either<ErrorModel, PlaceDetailsModel>> call(int placeId) async {
    return await _placeDetailsRepository.getPlaceDetails(placeId);
  }
}
