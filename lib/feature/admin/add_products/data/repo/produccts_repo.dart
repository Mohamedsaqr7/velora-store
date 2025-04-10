import 'package:dio/dio.dart';
import 'package:velora/core/networking/api_service.dart';
import 'package:velora/core/networking/graphql/admin/products_query.dart';
import 'package:velora/feature/admin/add_products/data/model/create_product_request_body.dart';
import 'package:velora/feature/admin/add_products/data/model/get_all_products_response.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';

class ProductsRepo {
  final ApiService _apiService;

  ProductsRepo(this._apiService);
  Future<ApiResult<GetAllProductResponse>> getAllProducts() async {
    try {
      final response = await _apiService
          .getAllProduct(ProductsQueries().getAllProductsQuery());
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> createProduct({required CreateProductRequestModel createProduct}) async {
    try {
      final response = await _apiService
          .createProduct(ProductsQueries().createProductQuery(body: createProduct));
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
