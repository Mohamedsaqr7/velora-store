import 'package:dio/dio.dart';
import 'package:velora/feature/auth/login/data/model/user_role_response.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';

class ProfileRepo {
  ProfileRepo(this._apiService);
  final ApiService _apiService;

  Future<ApiResult<UserRoleResponse>> getUserProfile() async {
    try {
      final result = await _apiService.userRole();
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ErrorHandler.handle(e));
      }
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
