import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/place_details/data/models/favorite_place.dart';
import 'package:review_app/src/features/place_details/domain/repository/place_details_repository.dart';

class AddFavoritePlaceUc {
  final IPlaceDetailsRepository _placeDetailsRepository;

  AddFavoritePlaceUc(
    this._placeDetailsRepository,
  );

  Future<Either<ErrorModel, FavoritePlaceModel>> call(int placeId) async {
    return await _placeDetailsRepository.addToFavorites(placeId);
  }
}
