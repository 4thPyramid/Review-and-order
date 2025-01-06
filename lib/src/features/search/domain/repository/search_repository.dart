import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/search/data/datasourse/search_remote_ds.dart';
import 'package:review_app/src/features/search/data/model/search_model.dart';

abstract class ISearchRepository {
  Future<Either<ErrorModel, SearchResponse>> getSearchResult(String query);
}

class SearchRepository implements ISearchRepository {
  final ISearchRemoteDataSource _searchRemoteDataSource;

  SearchRepository(this._searchRemoteDataSource);
  @override
  Future<Either<ErrorModel, SearchResponse>> getSearchResult(String query) =>
      _searchRemoteDataSource.getSearchResult(query);
}
