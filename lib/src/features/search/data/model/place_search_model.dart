import 'package:json_annotation/json_annotation.dart';

part 'place_search_model.g.dart';

@JsonSerializable()
class PlaceSearchModel {
  final int id;
  final String name;

  @JsonKey(name: 'cover_image')
  final String? coverImage;

  final String status;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  PlaceSearchModel({
    required this.id,
    required this.name,
    this.coverImage,
    required this.status,
    required this.updatedAt,
  });

  factory PlaceSearchModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceSearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceSearchModelToJson(this);
}
