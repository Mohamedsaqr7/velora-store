import 'package:dio/dio.dart';
import 'package:velora/core/networking/api_service.dart';
import 'package:velora/core/networking/graphql/customer/search_query.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../admin/add_products/data/model/get_all_products_response.dart';
import '../models/search_request_body.dart';

class SearchRepo {
  final ApiService _apiService;

  SearchRepo(this._apiService);
  
  Future<ApiResult<GetAllProductResponse>> searchProducts(
    SearchRequestBody model,
  ) async {
    try {
      final response = await _apiService.searchProducts(
        SearchQueries().searchProduct(body: model),
      );
      return ApiResult.success(response);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ErrorHandler.handle(e));
      }
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
