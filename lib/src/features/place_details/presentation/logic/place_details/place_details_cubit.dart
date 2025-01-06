import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/place_details/data/models/place_details_model.dart';
import 'package:review_app/src/features/place_details/domain/usecase/get_place_details_uc.dart';

part 'place_details_state.dart';
part 'place_details_cubit.freezed.dart';

class PlaceDetailsCubit extends Cubit<PlaceDetailsState> {
  final GetPlaceDetailsUc getPlaceDetailsUc;

  PlaceDetailsCubit(this.getPlaceDetailsUc)
      : super(const PlaceDetailsState.initial());
  Future<void> getPlaceDetails(int placeId) async {
    if (isClosed) return;

    emit(const PlaceDetailsState.initial());
    emit(const PlaceDetailsState.loading());
    final result = await getPlaceDetailsUc.call(placeId);
    result.fold(
      (l) => {if (!isClosed) emit(PlaceDetailsState.error(l))},
      (r) => {if (!isClosed) emit(PlaceDetailsState.loaded(r))},
    );
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
