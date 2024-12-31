import 'package:json_annotation/json_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel {
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'status')
  final String? code;

  ErrorModel({
    required this.message,
    this.code,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);
}
