import 'package:dartz/dartz.dart';
import 'package:review_app/src/features/favorite/data/model/favorite_response.dart';

import '../../../../../core/data/api/api_consumer.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exceptions.dart';

abstract class FavoriteApiServices {
  Future<Either<ErrorModel, FavoriteResponse>> getFavoriteList();
}

class FavoriteApiServicesImpl implements FavoriteApiServices {
  final ApiConsumer _api;
  FavoriteApiServicesImpl(this._api);
  @override
  Future<Either<ErrorModel, FavoriteResponse>> getFavoriteList() async {
    try {
      final response = await _api.get('favorites');
      final favorite = FavoriteResponse.fromJson(response);
      return Right(favorite);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
