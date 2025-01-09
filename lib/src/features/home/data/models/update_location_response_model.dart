import 'package:json_annotation/json_annotation.dart';

part 'update_location_response_model.g.dart';

@JsonSerializable()
class UpdateLocationResponse {
  final String message;

  UpdateLocationResponse({required this.message});

  factory UpdateLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateLocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateLocationResponseToJson(this);
}
