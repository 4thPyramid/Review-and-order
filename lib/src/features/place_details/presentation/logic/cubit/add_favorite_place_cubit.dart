import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/place_details/data/models/favorite_place.dart';
import 'package:review_app/src/features/place_details/domain/usecase/add_favorite_place_uc.dart';

part 'add_favorite_place_state.dart';
part 'add_favorite_place_cubit.freezed.dart';

class AddFavoritePlaceCubit extends Cubit<AddFavoritePlaceState> {
  final AddFavoritePlaceUc addFavoritePlaceUc;
  int status = 0;
  AddFavoritePlaceCubit(this.addFavoritePlaceUc)
      : super(const AddFavoritePlaceState.initial());

  Future<void> addFavoritePlace(int placeId) async {
    emit(const AddFavoritePlaceState.loading());

    final result = await addFavoritePlaceUc(placeId);

    result.fold(
      (l) => {emit(AddFavoritePlaceState.error(l))},
      (r) => {status = r.status, emit(AddFavoritePlaceState.success(r))},
    );
  }
}
