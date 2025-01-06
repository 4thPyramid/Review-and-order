import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:review_app/core/data/api/api_consumer.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/core/errors/exceptions.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';

abstract class SearchApiService {
  Future<Either<ErrorModel, List<PlaceModel>>> getSearchResult(String query);
}

class SearchApiServiceImpl implements SearchApiService {
  final ApiConsumer _api;

  SearchApiServiceImpl(this._api);

  @override
  Future<Either<ErrorModel, List<PlaceModel>>> getSearchResult(
      String query) async {
    try {
      final response = await _api.get('search/$query');

      final places = List<PlaceModel>.from(
        response.map((x) => PlaceModel.fromJson(x)),
      );

      return Right(places);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
