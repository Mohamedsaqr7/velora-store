import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:velora/core/networking/api_constants.dart';
import 'package:velora/feature/auth/login/data/model/login_request_body.dart';
import 'package:velora/feature/auth/login/data/model/login_response.dart';

import '../../feature/auth/login/data/model/user_role_response.dart';
import '../app/upload_image/model/upload_image_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @GET(ApiConstants.userRole)
  Future<UserRoleResponse> userRole();
  @POST(ApiConstants.uploadImage)
  Future<UploadImageResourse> uploadImage(
    @Body() FormData file,
  );
}
