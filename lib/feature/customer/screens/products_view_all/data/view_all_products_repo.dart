import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/core/networking/api_result.dart';
import 'package:velora/core/networking/api_service.dart';
import 'package:velora/core/networking/graphql/customer/view_all_products_query.dart';
import 'package:velora/feature/admin/add_products/data/model/get_all_products_response.dart';

import '../../../../../core/networking/api_error_handler.dart';

class ViewAllProductsRepo {
  final ApiService _apiService;

  ViewAllProductsRepo(this._apiService);
  Future<ApiResult<GetAllProductResponse>> ViewAllProducts(
      {required int offset}) async {
    try {
      final result = await _apiService.viewAllProducts(
          ProductViewAllQueries().getProductsViewAllQuery(offset: offset));
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ErrorHandler.handle(e));
      }
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
