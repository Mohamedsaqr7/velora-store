import 'package:json_annotation/json_annotation.dart';
part "../users_number_response.g.dart";

@JsonSerializable()
class UsersNumberResponse {
  UsersNumberResponse(this.data);
  UsersNumberData data;

  factory UsersNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersNumberResponseFromJson(json);
  String get usersNumber {
    if (data.usersList!.isEmpty) {
      return "0";
    }
    return data.usersList!.length.toString();
  }
}

@JsonSerializable()
class UsersNumberData {
  UsersNumberData(this.usersList);
  @JsonKey(name: 'users')
  final List<UsersNumberModel>? usersList;

  factory UsersNumberData.fromJson(Map<String, dynamic> json) =>
      _$UsersNumberDataFromJson(json);
}

@JsonSerializable()
class UsersNumberModel {
  UsersNumberModel(this.name);

  factory UsersNumberModel.fromJson(Map<String, dynamic> json) =>
      _$UsersNumberModelFromJson(json);

  final String? name;
}
