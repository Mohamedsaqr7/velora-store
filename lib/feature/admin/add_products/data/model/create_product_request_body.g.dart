// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_product_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProductRequestModel _$CreateProductRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateProductRequestModel(
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toInt(),
      categoryId: (json['categoryId'] as num).toInt(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CreateProductRequestModelToJson(
        CreateProductRequestModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'categoryId': instance.categoryId,
      'images': instance.images,
    };
