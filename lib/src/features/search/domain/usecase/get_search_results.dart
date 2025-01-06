import 'package:dartz/dartz.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/search/domain/repository/search_repository.dart';

class GetSearchResults {
  final ISearchRepository _searchRepository;
  GetSearchResults(this._searchRepository);
  Future<Either<ErrorModel, List<PlaceModel>>> call(String query) =>
      _searchRepository.getSearchResult(query);
}
