import 'package:json_annotation/json_annotation.dart';
part 'products_number_response.g.dart';

@JsonSerializable()
class ProductsNumberResponse {
  ProductsNumberResponse(this.data);
  ProductsNumberData data;

  factory ProductsNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsNumberResponseFromJson(json);
  String get productsNumber {
    if (data.productsList!.isEmpty) {
      return "0";
    }
    return data.productsList!.length.toString();
  }
}

@JsonSerializable()
class ProductsNumberData {
  ProductsNumberData(this.productsList);
  @JsonKey(name: 'products')
  final List<ProductsNumberModel>? productsList;

  factory ProductsNumberData.fromJson(Map<String, dynamic> json) =>
      _$ProductsNumberDataFromJson(json);
}

@JsonSerializable()
class ProductsNumberModel {
  ProductsNumberModel(this.title);

  factory ProductsNumberModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsNumberModelFromJson(json);

  final String? title;
}
