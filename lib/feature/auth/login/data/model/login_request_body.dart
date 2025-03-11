import 'package:json_annotation/json_annotation.dart';
part 'login_request_body.g.dart';
@JsonSerializable()
class LoginRequestModel {
  LoginRequestModel({required this.email, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  final String email;
  final String password;
}
