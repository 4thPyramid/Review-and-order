// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteResponse _$FavoriteResponseFromJson(Map<String, dynamic> json) =>
    FavoriteResponse(
      currentPage: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => FavoriteData.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String,
      lastPage: (json['last_page'] as num).toInt(),
      lastPageUrl: json['last_page_url'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String,
      perPage: (json['per_page'] as num).toInt(),
      prevPageUrl: json['prev_page_url'] as String?,
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$FavoriteResponseToJson(FavoriteResponse instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data.map((e) => e.toJson()).toList(),
      'first_page_url': instance.firstPageUrl,
      'last_page': instance.lastPage,
      'last_page_url': instance.lastPageUrl,
      'links': instance.links.map((e) => e.toJson()).toList(),
      'next_page_url': instance.nextPageUrl,
      'path': instance.path,
      'per_page': instance.perPage,
      'prev_page_url': instance.prevPageUrl,
      'total': instance.total,
    };

FavoriteData _$FavoriteDataFromJson(Map<String, dynamic> json) => FavoriteData(
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
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageData.fromJson(e as Map<String, dynamic>))
          .toList(),
      pivot: Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteDataToJson(FavoriteData instance) =>
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
      'images': instance.images.map((e) => e.toJson()).toList(),
      'pivot': instance.pivot.toJson(),
    };

ImageData _$ImageDataFromJson(Map<String, dynamic> json) => ImageData(
      placeId: (json['place_id'] as num).toInt(),
      image: json['image'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$ImageDataToJson(ImageData instance) => <String, dynamic>{
      'place_id': instance.placeId,
      'image': instance.image,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Pivot _$PivotFromJson(Map<String, dynamic> json) => Pivot(
      userId: (json['user_id'] as num).toInt(),
      placeId: (json['place_id'] as num).toInt(),
    );

Map<String, dynamic> _$PivotToJson(Pivot instance) => <String, dynamic>{
      'user_id': instance.userId,
      'place_id': instance.placeId,
    };

Link _$LinkFromJson(Map<String, dynamic> json) => Link(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'url': instance.url,
      'label': instance.label,
      'active': instance.active,
    };
