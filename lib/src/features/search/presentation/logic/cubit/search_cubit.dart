import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:review_app/core/errors/error_model.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/search/data/model/search_model.dart';
import 'package:review_app/src/features/search/domain/usecase/get_search_results.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  final GetSearchResults _getSearchResults;
  SearchCubit(this._getSearchResults) : super(const SearchState.initial());

  Future<void> getSearchResult(String query) async {
    emit(const SearchState.loading());
    try {
      final result = await _getSearchResults(query);
      result.fold(
        (error) => emit(SearchState.error(error)),
        (places) => emit(SearchState.loaded([places])),
      );
    } catch (e) {
      emit(SearchState.error(
          ErrorModel(message: 'An unexpected error occurred: $e')));
    }
  }
}
