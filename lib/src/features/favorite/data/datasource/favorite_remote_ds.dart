import 'package:dartz/dartz.dart';

import '../../../../../core/errors/error_model.dart';
import '../model/favorite_response.dart';
import 'favorite_api_services.dart';

abstract class IFavoriteRemoteDs {
  Future<Either<ErrorModel, FavoriteResponse>> getFavoriteList();
}

class FavoriteRemoteDsImpl implements IFavoriteRemoteDs {
  final FavoriteApiServices apiService;
  FavoriteRemoteDsImpl({required this.apiService});

  @override
  Future<Either<ErrorModel, FavoriteResponse>> getFavoriteList() {
    return apiService.getFavoriteList();
  }
}
