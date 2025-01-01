// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'one_place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnePlaceModel _$OnePlaceModelFromJson(Map<String, dynamic> json) =>
    OnePlaceModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      mapDisc: json['map_disc'] as String,
      longitude: json['longitude'] as String,
      latitude: json['latitude'] as String,
      rating: (json['rating'] as num).toDouble(),
      status: json['status'] as String,
      openAt: json['open_at'] as String,
      closeAt: json['close_at'] as String,
      categoryId: (json['category_id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      coverImage: json['cover_image'] as String?,
      reviewsCount: (json['reviews_count'] as num).toInt(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OnePlaceModelToJson(OnePlaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'map_disc': instance.mapDisc,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'rating': instance.rating,
      'status': instance.status,
      'open_at': instance.openAt,
      'close_at': instance.closeAt,
      'category_id': instance.categoryId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'cover_image': instance.coverImage,
      'reviews_count': instance.reviewsCount,
      'reviews': instance.reviews,
      'images': instance.images,
    };

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      image: json['image'] as String,
      userId: (json['user_id'] as num).toInt(),
      placeId: (json['place_id'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'image': instance.image,
      'user_id': instance.userId,
      'place_id': instance.placeId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel();

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{};
