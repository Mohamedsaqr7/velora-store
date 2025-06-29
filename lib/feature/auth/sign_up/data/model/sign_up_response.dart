import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';
@JsonSerializable()
class SignUpResponseModel {
  SignUpResponseModel({
    required this.sighnUpdate,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);

  @JsonKey(name: 'data')
  final SignUpDateModel sighnUpdate;
}

@JsonSerializable()
class SignUpDateModel {
  SignUpDateModel({required this.addUser});

  factory SignUpDateModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpDateModelFromJson(json);

  final AddUserModel? addUser;
}

@JsonSerializable()
class AddUserModel {
  AddUserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
    required this.role,
  });

  factory AddUserModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserModelFromJson(json);
  final String id;
  final String email;
  final String name;
  final String avatar;
  final String role;
}
