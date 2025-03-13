import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:velora/core/networking/api_constants.dart';
import 'package:velora/feature/auth/login/data/model/login_request_body.dart';
import 'package:velora/feature/auth/login/data/model/login_response.dart';
import 'package:velora/feature/auth/sign_up/data/model/sign_up_response.dart';

import '../../feature/admin/dashboard/data/models/categories_number_response.dart';
import '../../feature/admin/dashboard/data/models/products_number_response.dart';
import '../../feature/admin/dashboard/data/models/users_number_response.dart';
import '../../feature/auth/login/data/model/user_role_response.dart';
import '../../feature/auth/sign_up/data/model/sign_up_request_body.dart';
import '../app/upload_image/model/upload_image_response.dart';
part 'api_service.g.dart';

@RestApi(
  baseUrl: ApiConstants.apiBaseUrl,
)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.graphQl)
  Future<LoginResponseModel> login(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<SignUpResponseModel> signUp(
    @Body() Map<String, dynamic> body,
  );

  @GET(ApiConstants.userProfile)
  Future<UserRoleResponse> userRole();

  @POST(ApiConstants.uploadImage)
  Future<UploadImageResourse> uploadImage(
    @Body() FormData file,
  );

  @POST(ApiConstants.graphQl)
  Future<ProductsNumberResponse> numberOfProducts(
    @Body() Map<String, dynamic> query,
  );

  @POST(ApiConstants.graphQl)
  Future<CategoriesNumberResponse> numberOfCategories(
    @Body() Map<String, dynamic> query,
  );

  @POST(ApiConstants.graphQl)
  Future<UsersNumberResponse> numberOfUsers(
    @Body() Map<String, dynamic> query,
  );
}
