import 'package:json_annotation/json_annotation.dart';

part 'place_details_model.g.dart';

@JsonSerializable()
class PlaceDetailsModel {
  final int? id;
  final String? name;
  @JsonKey(name: 'map_disc')
  final String? mapDisc;
  final String? longitude;
  final String? latitude;
  final double? rating;
  final String? status;
  @JsonKey(name: 'open_at')
  final String? openAt;
  @JsonKey(name: 'close_at')
  final String? closeAt;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'cover_image')
  final String? coverImage;
  @JsonKey(name: 'user_rating', defaultValue: null)
  final double? userRating;
  @JsonKey(name: 'reviews_count')
  final int? reviewsCount;
  final List<ReviewModel>? reviews;
  final List<ImageModel>? images;
  final List<RatingModel>? ratings;

  PlaceDetailsModel({
    this.id,
    this.name,
    this.mapDisc,
    this.longitude,
    this.latitude,
    this.rating,
    this.status,
    this.openAt,
    this.closeAt,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.coverImage,
    this.reviewsCount,
    this.reviews,
    this.images,
    this.ratings,
    this.userRating,
  });

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceDetailsModelToJson(this);
}

@JsonSerializable()
class ReviewModel {
  final int? id;
  final String? content;
  final String? image;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'place_id')
  final int? placeId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'user_rating')
  final double? userRating;
  final UserModel? user;

  ReviewModel({
    this.id,
    this.content,
    this.image,
    this.userId,
    this.placeId,
    this.createdAt,
    this.updatedAt,
    this.userRating,
    this.user,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}

@JsonSerializable()
class UserModel {
  final int? id;
  final String? name;
  final String? phone;
  final String? email;
  final String? image;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  UserModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class ImageModel {
  @JsonKey(name: 'place_id')
  final int? placeId;
  final String? image;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  ImageModel({
    this.placeId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

@JsonSerializable()
class RatingModel {
  final int? id;
  final int? rating;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'place_id')
  final int? placeId;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  RatingModel({
    this.id,
    this.rating,
    this.userId,
    this.placeId,
    this.createdAt,
    this.updatedAt,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingModelToJson(this);
}
