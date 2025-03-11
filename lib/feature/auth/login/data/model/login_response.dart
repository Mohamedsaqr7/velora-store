import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponseModel {
  LoginResponseModel({required this.userData});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  @JsonKey(name: 'data')
  final UserDataModel userData;
}

@JsonSerializable()
class UserDataModel {
  UserDataModel({required this.login});
  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  final LoginModel login;
}

@JsonSerializable()
class LoginModel {
  LoginModel({required this.accessToken, required this.refreshToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @JsonKey(name: 'access_token')
  final String? accessToken;

  @JsonKey(name: 'refresh_token')
  final String? refreshToken;
}
