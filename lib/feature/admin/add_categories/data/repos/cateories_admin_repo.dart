import 'package:velora/core/networking/api_service.dart';
import 'package:velora/core/networking/graphql/admin/categories_query.dart';
import 'package:velora/feature/admin/add_categories/data/models/create_categories_response.dart';
import 'package:velora/feature/admin/add_categories/data/models/get_all_categories_response.dart';
import 'package:velora/feature/admin/add_categories/data/models/update_category_request_body.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../models/create_categories_request_body.dart';

class CategoreisAdminRepo {
  final ApiService _apiService;

  CategoreisAdminRepo(this._apiService);
  Future<ApiResult<CategoriesResponseModel>> getCategories() async {
    try {
      final response =
          await _apiService.getCategories(CategoriesQuery.getCategoriesQuery());
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<CreateCategoryResponse>> createCategory({
    required CreateCategoryRequestModel createCategoryModel,
  }) async {
    try {
      final response = await _apiService.createCategory(
        CategoriesQuery.createCategoriesQuery(
          body: createCategoryModel,
        ),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult<void>> deleteCategory({required String categoryId}) async {
    try {
      final response = await _apiService.deleteCategory(
        CategoriesQuery.deleteCategoryQuery(categoryId: categoryId),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  
  Future<ApiResult<void>> updateCategory( {
    required UpdateCategoryRequestBody categoryModel,
  }) async {
    try {
      final response = await _apiService.updateCategory(
        CategoriesQuery().updateCategoryQuery(
          body: categoryModel,
        ),
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
