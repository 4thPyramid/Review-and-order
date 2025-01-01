import 'package:json_annotation/json_annotation.dart';

part 'place_model.g.dart';

@JsonSerializable()
class PlaceModel {
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

  PlaceModel({
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
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceModelToJson(this);
}
