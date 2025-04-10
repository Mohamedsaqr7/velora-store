import 'package:json_annotation/json_annotation.dart';

part 'create_product_request_body.g.dart';

@JsonSerializable()
class CreateProductRequestModel {
  CreateProductRequestModel({
    required this.title,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.images,
  });

  factory CreateProductRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateProductRequestModelFromJson(json);

  final String title;
  final String description;
  final int price;
  final int categoryId;
  final List<String> images;

  Map<String, dynamic> toJson() => _$CreateProductRequestModelToJson(this);
}
