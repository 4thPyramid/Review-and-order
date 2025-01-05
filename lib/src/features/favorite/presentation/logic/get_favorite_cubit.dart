import 'package:bloc/bloc.dart';
import 'package:review_app/src/features/favorite/domain/usecase/get_favorite_use_case.dart';

import 'get_favorite_state.dart';

class GetFavoriteCubit extends Cubit<GetFavoriteState> {
  final GetFavoriteUseCase getFavorite;

  GetFavoriteCubit(this.getFavorite) : super(const GetFavoriteState.initial());

  Future<void> getFavoriteList() async {
    if (isClosed) return;

    emit(const GetFavoriteState.loading());
    final result = await getFavorite.call();
    result.fold(
      (error) => emit(GetFavoriteState.error(error)),
      (response) => emit(GetFavoriteState.loaded(response )),
    );
  }
}
