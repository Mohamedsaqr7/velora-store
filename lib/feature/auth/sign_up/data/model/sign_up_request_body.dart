import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';
@JsonSerializable()
class SignUpRequestModel {
  SignUpRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestModelFromJson(json);
  final String name;
  final String email;
  final String password;
  final String avatar;
}
