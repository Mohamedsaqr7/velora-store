import 'package:json_annotation/json_annotation.dart';

part 'create_categories_request_body.g.dart';

@JsonSerializable()
class CreateCategoryRequestModel {
  CreateCategoryRequestModel({required this.name, required this.image});

  factory CreateCategoryRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryRequestModelFromJson(json);

  final String name;
  final String image;

  Map<String, dynamic> toJson() => _$CreateCategoryRequestModelToJson(this);
}
