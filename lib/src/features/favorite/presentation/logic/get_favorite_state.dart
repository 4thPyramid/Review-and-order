import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:review_app/src/features/favorite/data/model/favorite_response.dart';

import '../../../../../core/errors/error_model.dart';

part  'get_favorite_state.freezed.dart';

@freezed
class GetFavoriteState with _$GetFavoriteState {
  const factory GetFavoriteState.initial() = _Initial;
  const factory GetFavoriteState.loading() = _Loading;
  const factory GetFavoriteState.loaded(FavoriteResponse favorite) = _Loaded;
  const factory GetFavoriteState.error(ErrorModel message) = _Error;
}
