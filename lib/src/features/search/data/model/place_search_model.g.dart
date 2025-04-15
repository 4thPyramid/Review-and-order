// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSearchModel _$PlaceSearchModelFromJson(Map<String, dynamic> json) =>
    PlaceSearchModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name']?.toString() ?? '',
      coverImage: json['cover_image']?.toString(),
      status: json['status']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
    );

Map<String, dynamic> _$PlaceSearchModelToJson(PlaceSearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover_image': instance.coverImage,
      'status': instance.status,
      'updated_at': instance.updatedAt,
    };
