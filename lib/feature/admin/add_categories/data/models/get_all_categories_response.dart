import 'package:json_annotation/json_annotation.dart';

part 'get_all_categories_response.g.dart';

@JsonSerializable()
class CategoriesResponseModel {
  CategoriesResponseModel({
    required this.data,
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);

   final CategoriesData data;

  Map<String, dynamic> toJson() => _$CategoriesResponseModelToJson(this);
}

@JsonSerializable()
class CategoriesData {
  CategoriesData({
    required this.categories,
  });

  factory CategoriesData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataFromJson(json);

   List<Category> categories;
  

  Map<String, dynamic> toJson() => _$CategoriesDataToJson(this);
}

@JsonSerializable()
class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  final String id;
  final String name;
  final String image;

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
