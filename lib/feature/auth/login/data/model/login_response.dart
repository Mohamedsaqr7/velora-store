import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {
  LoginDataModel data;
  LoginResponse({
    required this.data,
  });
factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class LoginDataModel {
  LoginDataModel({
    required this.login,
  });
  LoginModel login;
  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);
}

@JsonSerializable()
class LoginModel {
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  LoginModel({
    this.accessToken,
    this.refreshToken,
  });
factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

}
