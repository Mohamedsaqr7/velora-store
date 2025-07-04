import 'package:json_annotation/json_annotation.dart';
part "categories_number_response.g.dart";

@JsonSerializable()
class CategoriesNumberResponse {
  CategoriesNumberResponse(this.data);
  CategoriesNumberData data;

  factory CategoriesNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesNumberResponseFromJson(json);
  String get categoriesNumber {
    if (data.categoriesList!.isEmpty) {
      return "0";
    }
    return data.categoriesList!.length.toString();
  }
}

@JsonSerializable()
class CategoriesNumberData {
  CategoriesNumberData(this.categoriesList);
  @JsonKey(name: 'categories')
  final List<CategoriesNumberModel>? categoriesList;

  factory CategoriesNumberData.fromJson(Map<String, dynamic> json) =>
      _$CategoriesNumberDataFromJson(json);
}

@JsonSerializable()
class CategoriesNumberModel {
  CategoriesNumberModel(this.name);

  factory CategoriesNumberModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesNumberModelFromJson(json);

  final String? name;
}
