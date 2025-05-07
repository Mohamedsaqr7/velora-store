import 'package:dio/dio.dart';
import 'package:velora/core/networking/api_error_handler.dart';
import 'package:velora/core/networking/api_result.dart';
import 'package:velora/core/networking/api_service.dart';
import 'package:velora/core/networking/graphql/customer/category_query.dart';
import 'package:velora/feature/admin/add_products/data/model/get_all_products_response.dart';


class HomeCategoryRepo{
  final ApiService _apiService;

  HomeCategoryRepo(this._apiService);

  Future<ApiResult<GetAllProductResponse>> getProductsByCategory(
    int categoryId,
  ) async {
    try {
      final response = await _apiService.homeCategories(
        CategoryQueries().getCatgeoryQuery(categoryId: categoryId),
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