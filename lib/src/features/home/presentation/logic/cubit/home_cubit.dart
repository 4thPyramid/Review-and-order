import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/home/domain/usecase/get_new_places.dart';
import 'package:review_app/src/features/home/domain/usecase/get_top_rated_places.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetNewPlacesUC _getNewPlacesUC;
  final GetTopRatedPlacesUC _getTopRatedPlacesUC;
  HomeCubit(this._getNewPlacesUC, this._getTopRatedPlacesUC)
      : super(const HomeState.initial());

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
}
