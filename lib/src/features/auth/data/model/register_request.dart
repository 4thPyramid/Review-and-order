import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterAuthData {
  final String name;
  final String email;
  final String phone;
  final String password;

  RegisterAuthData({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
  });

  // لتحويل JSON إلى كائن من نوع RegisterAuthData
  factory RegisterAuthData.fromJson(Map<String, dynamic> json) =>
      _$RegisterAuthDataFromJson(json);

  // لتحويل كائن RegisterAuthData إلى JSON
  Map<String, dynamic> toJson() => _$RegisterAuthDataToJson(this);
}
