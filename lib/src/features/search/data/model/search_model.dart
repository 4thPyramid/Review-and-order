import 'package:json_annotation/json_annotation.dart';
import 'package:review_app/src/features/home/data/models/place_model.dart';
import 'package:review_app/src/features/search/data/model/link_model.dart';
import 'package:review_app/src/features/search/data/model/place_search_model.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: 'current_page')
  final int currentPage;

  final List<PlaceSearchModel> data;

  @JsonKey(name: 'first_page_url')
  final String firstPageUrl;

  final int from;

  @JsonKey(name: 'last_page')
  final int lastPage;

  @JsonKey(name: 'last_page_url')
  final String lastPageUrl;

  final List<LinkModel> links;

  @JsonKey(name: 'next_page_url')
  final String nextPageUrl;

  final String path;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'prev_page_url')
  final String prevPageUrl;

  final int to;

  final int total;

  SearchResponse({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
