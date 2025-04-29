
import 'package:velora/core/networking/api_result.dart';
import 'package:velora/core/networking/graphql/admin/products_query.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_service.dart';
import '../../../../../core/networking/graphql/admin/categories_query.dart';
import '../../../../admin/add_categories/data/models/get_all_categories_response.dart';
import '../../../../admin/add_products/data/model/get_all_products_response.dart';

class CustomerHomeRepo {
  CustomerHomeRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<CategoriesResponseModel>> getCategories() async {
    try {
      final response =
          await _apiService.getCategories(CategoriesQuery.getCategoriesQuery());
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  Future<ApiResult<GetAllProductResponse>> getAllProducts() async {
    try {
      final response = await _apiService
          .getAllProduct(ProductsQueries().getAllProductsQuery());
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }


}