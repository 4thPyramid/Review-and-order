import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/search/data/datasourse/search_api_service.dart';
import 'package:review_app/src/features/search/data/model/search_model.dart';

abstract class ISearchRemoteDataSource {
  Future<Either<ErrorModel, SearchResponse>> getSearchResult(String query);
}

class SearchRemoteDataSource implements ISearchRemoteDataSource {
  final SearchApiService _searchApiService;
  SearchRemoteDataSource(this._searchApiService);

  @override
  Future<Either<ErrorModel, SearchResponse>> getSearchResult(String query) =>
      _searchApiService.getSearchResult(query);
}
