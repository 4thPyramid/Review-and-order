import 'package:json_annotation/json_annotation.dart';

part 'favorite_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FavoriteResponse {
  @JsonKey(name: 'current_page')
  final int currentPage;

  final List<FavoriteData> data;

  @JsonKey(name: 'first_page_url')
  final String firstPageUrl;

 // final int from;

  @JsonKey(name: 'last_page')
  final int lastPage;

  @JsonKey(name: 'last_page_url')
  final String lastPageUrl;

  final List<Link> links;

  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;

  final String path;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;

  //final int to;
  final int total;

  FavoriteResponse({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
  //  required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
   // required this.to,
    required this.total,
  });

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FavoriteData {
  final int id;
  final String name;

  @JsonKey(name: 'map_disc')
  final String mapDisc;

  final String longitude;
  final String latitude;
  final double rating;
  final String status;

  @JsonKey(name: 'open_at')
  final String openAt;

  @JsonKey(name: 'close_at')
  final String closeAt;

  @JsonKey(name: 'category_id')
  final int categoryId;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'cover_image')
  final String? coverImage;

  @JsonKey(name: 'reviews_count')
  final int reviewsCount;

  final List<ImageData> images;

  final Pivot pivot;

  FavoriteData({
    required this.id,
    required this.name,
    required this.mapDisc,
    required this.longitude,
    required this.latitude,
    required this.rating,
    required this.status,
    required this.openAt,
    required this.closeAt,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
    this.coverImage,
    required this.reviewsCount,
    required this.images,
    required this.pivot,
  });

  factory FavoriteData.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDataFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteDataToJson(this);
}

@JsonSerializable()
class ImageData {
  @JsonKey(name: 'place_id')
  final int placeId;

  final String image;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  ImageData({
    required this.placeId,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) =>
      _$ImageDataFromJson(json);

  Map<String, dynamic> toJson() => _$ImageDataToJson(this);
}

@JsonSerializable()
class Pivot {
  @JsonKey(name: 'user_id')
  final int userId;

  @JsonKey(name: 'place_id')
  final int placeId;

  Pivot({
    required this.userId,
    required this.placeId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => _$PivotFromJson(json);

  Map<String, dynamic> toJson() => _$PivotToJson(this);
}

@JsonSerializable()
class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
