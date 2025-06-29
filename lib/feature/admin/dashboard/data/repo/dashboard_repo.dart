import 'package:velora/core/networking/api_service.dart';
import 'package:velora/core/networking/graphql/admin/dashboard_query.dart';
import 'package:velora/feature/admin/dashboard/data/models/categories_number_response.dart';
import 'package:velora/feature/admin/dashboard/data/models/products_number_response.dart';
import 'package:velora/feature/admin/dashboard/data/models/users_number_response.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';

class DashboardRepo {
  final ApiService _apiService;

  DashboardRepo(this._apiService);
  // Get Numbers Of Products

  Future<ApiResult<ProductsNumberResponse>> numberOfProducts() async {
    try {
      final respone = await _apiService
          .numberOfProducts(DashBoardQueries().numberOfProductsMapQuery());
      return ApiResult.success(respone);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  // Get Numbers Of Categories

  Future<ApiResult<CategoriesNumberResponse>> numberOfCategories() async {
    try {
      final response = await _apiService
          .numberOfCategories(DashBoardQueries().numberOfCategoriesMapQuery());
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  // Get Numbers Of Users
  Future<ApiResult<UsersNumberResponse>> numberOfUsers() async {
    try {
      final response = await _apiService
          .numberOfUsers(DashBoardQueries().numberOfUsersMapQuery());
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
