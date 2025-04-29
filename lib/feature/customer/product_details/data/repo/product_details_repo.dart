import 'package:dio/dio.dart';
import 'package:velora/core/networking/api_error_handler.dart';
import 'package:velora/feature/customer/product_details/data/model/product_details_response.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../../../../../core/networking/graphql/customer/product_details_query.dart';

class ProductDetailsRepo {
  ProductDetailsRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<ProductDetailsResponse>> getProductDetails({
    required int productId,
  }) async {
    try {
      final response = await _apiService.productDetails(ProductDetailsQuery()
          .getProductDetailsQuery(id: productId));
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ErrorHandler.handle(e));
      }
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
