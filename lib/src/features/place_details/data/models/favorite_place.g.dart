// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritePlaceModel _$FavoritePlaceModelFromJson(Map<String, dynamic> json) =>
    FavoritePlaceModel(
      (json['placeId'] as num?)?.toInt(),
      message: json['message'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$FavoritePlaceModelToJson(FavoritePlaceModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'placeId': instance.placeId,
      'status': instance.status,
    };
