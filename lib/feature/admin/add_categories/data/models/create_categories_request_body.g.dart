// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_categories_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCategoryRequestModel _$CreateCategoryRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateCategoryRequestModel(
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$CreateCategoryRequestModelToJson(
        CreateCategoryRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
    };
