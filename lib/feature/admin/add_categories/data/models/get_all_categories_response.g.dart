// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponseModel _$CategoriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesResponseModel(
      data: CategoriesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoriesResponseModelToJson(
        CategoriesResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CategoriesData _$CategoriesDataFromJson(Map<String, dynamic> json) =>
    CategoriesData(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesDataToJson(CategoriesData instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
