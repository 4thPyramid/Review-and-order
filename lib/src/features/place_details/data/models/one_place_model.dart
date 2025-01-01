import 'package:json_annotation/json_annotation.dart';

part 'one_place_model.g.dart';

@JsonSerializable()
class OnePlaceModel {
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
  final List<ReviewModel> reviews;
  final List<ImageModel> images;

  OnePlaceModel({
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
    required this.reviews,
    required this.images,
  });

  factory OnePlaceModel.fromJson(Map<String, dynamic> json) =>
      _$OnePlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnePlaceModelToJson(this);
}

@JsonSerializable()
class ReviewModel {
  final int id;
  final String content;
  final String image;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'place_id')
  final int placeId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  ReviewModel({
    required this.id,
    required this.content,
    required this.image,
    required this.userId,
    required this.placeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}

@JsonSerializable()
class ImageModel {
  const ImageModel();

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
