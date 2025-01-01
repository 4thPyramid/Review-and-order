import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/place_details/data/models/one_place_model.dart';
import 'package:review_app/src/features/place_details/domain/usecase/get_place_details_uc.dart';

part 'place_details_state.dart';
part 'place_details_cubit.freezed.dart';

class PlaceDetailsCubit extends Cubit<PlaceDetailsState> {
  final GetPlaceDetailsUc getPlaceDetailsUc;

  PlaceDetailsCubit(this.getPlaceDetailsUc)
      : super(const PlaceDetailsState.initial());

  Future<void> getPlaceDetails(int placeId) async {
    emit(const PlaceDetailsState.loading());
    final result = await getPlaceDetailsUc(placeId);
    result.fold(
      (l) => emit(PlaceDetailsState.error(l)),
      (r) => emit(PlaceDetailsState.loaded(r)),
    );
  }
}
