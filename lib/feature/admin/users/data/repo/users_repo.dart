import 'package:velora/core/networking/api_service.dart';
import 'package:velora/feature/admin/users/data/models/get_all_users_response.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/graphql/admin/users_query.dart';

class UsersRepo {
  final ApiService _apiService;

  UsersRepo(this._apiService);
  Future<ApiResult<GetAllUsersResponse>> getAllUsers() async {
    try {
      final result =
          await _apiService.getAllUsers(UsersQueries().getAllUsersQuery());
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  Future<ApiResult<void>> deleteUser({required String userId}) async {
    try {
      final result = await _apiService
          .deleteUser(UsersQueries().deleteUserQuery(userId: userId));
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

}
