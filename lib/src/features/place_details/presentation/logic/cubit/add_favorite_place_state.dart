part of 'add_favorite_place_cubit.dart';

@freezed
class AddFavoritePlaceState with _$AddFavoritePlaceState {
  const factory AddFavoritePlaceState.initial() = _Initial;
  const factory AddFavoritePlaceState.loading() = _Loading;
  const factory AddFavoritePlaceState.success(FavoritePlaceModel status) =
      _Success;
  const factory AddFavoritePlaceState.error(ErrorModel message) = _Error;
}
