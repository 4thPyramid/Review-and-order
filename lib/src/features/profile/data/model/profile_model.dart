import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String? image;
  //final DateTime createdAt;
  // final DateTime updatedAt;

  ProfileModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.image,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
