import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/datasource/favorite_remote_ds.dart';
import '../../data/model/favorite_response.dart';

abstract class IFavoriteRepository {
  Future<Either<ErrorModel, FavoriteResponse>> getFavorites();
}

class FavoriteRepositoryImpl implements IFavoriteRepository {
  final IFavoriteRemoteDs favoriteRemoteDs;

  FavoriteRepositoryImpl(this.favoriteRemoteDs);
  @override
  Future<Either<ErrorModel, FavoriteResponse>> getFavorites() {
    return favoriteRemoteDs.getFavoriteList();
  }
}
