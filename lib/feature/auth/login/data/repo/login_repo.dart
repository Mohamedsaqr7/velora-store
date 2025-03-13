import 'package:velora/core/networking/api_result.dart';
import 'package:velora/core/networking/api_service.dart';
import 'package:velora/core/networking/graphql/auth/login_query.dart';
import 'package:velora/feature/auth/login/data/model/login_response.dart';
import 'package:velora/feature/auth/login/data/model/user_role_response.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../model/login_request_body.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponseModel>> login(
      {required LoginRequestModel loginRequestBody}) async {
    try {
      final response = await _apiService.login(LoginQuery.loginQuery(model: loginRequestBody));
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

  // User Role
  Future<UserRoleResponse> userRole() async {
    final result = await _apiService.userRole();
    return result;
  }
}
