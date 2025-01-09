import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/home/domain/usecase/get_all_places.dart';
import 'package:review_app/src/features/home/domain/usecase/get_nears_places.dart';
import 'package:review_app/src/features/home/domain/usecase/get_new_places.dart';
import 'package:review_app/src/features/home/domain/usecase/get_top_rated_places.dart';
import 'package:review_app/src/features/home/domain/usecase/update_location.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  String currentFilter = 'top-rated';
  Position? currentPosition;

  final GetNewPlacesUC _getNewPlacesUC;
  final GetTopRatedPlacesUC _getTopRatedPlacesUC;
  final GetNearstPlacesUC _getNearstPlacesUC;
  final GetAllPlacesUC _getAllPlacesUC;
  final UpdateLocationUC _updateLocationUC;
  HomeCubit(
    this._getNewPlacesUC,
    this._getTopRatedPlacesUC,
    this._getNearstPlacesUC,
    this._getAllPlacesUC,
    this._updateLocationUC,
  ) : super(const HomeState.initial());

  Future<void> getNewPlaces() async {
    emit(const HomeState.loading());
    final result = await _getNewPlacesUC();
    result.fold(
      (l) => emit(HomeState.error(l)),
      (r) => emit(HomeState.loaded(r)),
    );
  }

  Future<void> getTopRatedPlaces() async {
    emit(const HomeState.loading());
    final result = await _getTopRatedPlacesUC();
    result.fold(
      (l) => emit(HomeState.error(l)),
      (r) => emit(HomeState.loaded(r)),
    );
  }

  void setFilter(String filter, {double? lat, double? lng}) {
    currentFilter = filter;
    if (filter == 'nearst' && lat != null && lng != null) {
      getPlacesByFilter(lat, lng);
    } else {
      getPlacesByFilter(lat ?? 0.0, lng ?? 0.0);
    }
  }

  Future<void> getPlacesByFilter(double lat, double lng) async {
    emit(const HomeState.loading());
    if (currentFilter == 'top-rated') {
      final result = await _getTopRatedPlacesUC();
      result.fold(
        (l) => emit(HomeState.error(l)),
        (r) => emit(HomeState.loaded(r)),
      );
    } else if (currentFilter == 'new') {
      final result = await _getNewPlacesUC();
      result.fold(
        (l) => emit(HomeState.error(l)),
        (r) => emit(HomeState.loaded(r)),
      );
    } else if (currentFilter == 'nearst') {
      final result = await _getNearstPlacesUC(lat, lng);
      result.fold(
        (l) => emit(HomeState.error(l)),
        (r) => emit(HomeState.loaded(r)),
      );
    } else {
      final result = await _getAllPlacesUC();
      result.fold(
        (l) => emit(HomeState.error(l)),
        (r) => emit(HomeState.loaded(r)),
      );
    }
  }

  Future<void> updateLocation() async {
    emit(const HomeState.loading());
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        emit(
            HomeState.error(ErrorModel(message: 'Location permission denied')));
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final result =
          await _updateLocationUC(position.latitude, position.longitude);

      result.fold(
        (l) => emit(HomeState.error(l)),
        (r) => emit(const HomeState.locationUpdated()),
      );

      if (currentFilter == 'nearst') {
        setFilter(currentFilter,
            lat: position.latitude, lng: position.longitude);
      }
    } catch (e) {
      emit(HomeState.error(
          ErrorModel(message: 'Failed to update location: $e')));
    }
  }
}
