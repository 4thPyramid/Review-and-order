part of 'place_details_cubit.dart';

@freezed
class PlaceDetailsState with _$PlaceDetailsState {
  const factory PlaceDetailsState.initial() = _Initial;
  const factory PlaceDetailsState.loading() = _Loading;
  const factory PlaceDetailsState.loaded(OnePlaceModel place) = _Loaded;
  const factory PlaceDetailsState.error(ErrorModel message) = _Error;
}
