// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSearchModel _$PlaceSearchModelFromJson(Map<String, dynamic> json) =>
    PlaceSearchModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      coverImage: json['cover_image'] as String?,
      status: json['status'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$PlaceSearchModelToJson(PlaceSearchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cover_image': instance.coverImage,
      'status': instance.status,
      'updated_at': instance.updatedAt,
    };
