import 'package:json_annotation/json_annotation.dart';

part 'favorite_place.g.dart';

@JsonSerializable()
class FavoritePlaceModel {
  final String message;
  final int? placeId;
  final int status;

  FavoritePlaceModel(
    this.placeId, {
    required this.message,
    required this.status,
  });

  factory FavoritePlaceModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritePlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritePlaceModelToJson(this);
}
