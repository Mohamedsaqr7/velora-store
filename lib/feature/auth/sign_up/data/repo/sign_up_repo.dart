
import 'package:dio/dio.dart';
import 'package:velora/core/networking/api_result.dart';
import 'package:velora/feature/auth/sign_up/data/model/sign_up_request_body.dart';
import 'package:velora/feature/auth/sign_up/data/model/sign_up_response.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_service.dart';
import '../../../../../core/networking/graphql/auth/sign_up_query.dart';

class SignUpRepo {
  SignUpRepo(this._apiService);

  final ApiService _apiService;

  Future<ApiResult<SignUpResponseModel>> signUp({
    required SignUpRequestModel requestModel,
  }) async {
    try {
      final result = await _apiService
          .signUp(SignUpQuery.signUpQuery(model: requestModel));
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ErrorHandler.handle(e));
      }
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

 
 
}
