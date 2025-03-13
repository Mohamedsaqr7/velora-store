// import 'package:velora/core/networking/api_error_handler.dart';
// import 'package:velora/core/networking/api_result.dart';
// import 'package:velora/feature/auth/sign_up/data/model/sign_up_request_body.dart';
// import 'package:velora/feature/auth/sign_up/data/model/sign_up_response.dart';

// import '../../../../../core/networking/api_service.dart';

// class SignupRepo {
//   final ApiService _apiService;

//   SignupRepo(this._apiService);

//   Future<ApiResult<UserModel>> signup(
//       String name, String email, String password) async {
//     try {
//       final response = await _apiService.signUp({
//         "name": name,
//         "email": email,
//         "password": password,
//         "avatar": "https://api.lorem.space/image/face?w=640&h=480",
//       });
//       print("📌 API Response Data: ${response}"); // ✅ طباعة الاستجابة
//       if (response == null) {
//         throw Exception("Response is null");
//       } // ✅ رمي الخطأ إذا كانت الاستجابة فارغة
//       return ApiResult.success(response);
//     } catch (errro) {
//       print("❌ API Request Failed: $errro"); // ✅ طباعة الخطأ قبل معالجته

//       return ApiResult.failure(ErrorHandler.handle(errro));
//     }
//   }
//   // Future<ApiResult<UserM
// }

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
