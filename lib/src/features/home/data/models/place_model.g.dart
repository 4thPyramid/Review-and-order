// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) => PlaceModel(
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
    );

Map<String, dynamic> _$PlaceModelToJson(PlaceModel instance) =>
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
    };
