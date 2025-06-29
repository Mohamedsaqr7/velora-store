import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_role_response.g.dart';
@JsonSerializable()
class UserRoleResponse {
  @JsonKey(name: 'role')
  final String? userRole;
@JsonKey(name: 'id')
  final int? userId;
  
  @JsonKey(name: 'name')
  final String? userName;

  @JsonKey(name: 'email')
  final String? userEmail;

  @JsonKey(name: 'avatar')
  final String? userImage;
  UserRoleResponse(this.userName, this.userEmail, this.userImage, {required this.userId, required this.userRole});

  factory UserRoleResponse.fromJson(Map<String, dynamic> json) =>
      _$UserRoleResponseFromJson(json);
}
