import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../../data/model/favorite_response.dart';
import '../repository/favorite_repository.dart';

class GetFavoriteUseCase {
  final IFavoriteRepository repository;

  GetFavoriteUseCase(this.repository);

   Future<Either<ErrorModel, FavoriteResponse>> call() async {
    return await repository.getFavorites();
  }
}