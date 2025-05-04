import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:velora/core/networking/api_constants.dart';
import 'package:velora/feature/auth/login/data/model/login_request_body.dart';
import 'package:velora/feature/auth/login/data/model/login_response.dart';
import 'package:velora/feature/auth/sign_up/data/model/sign_up_response.dart';

import '../../feature/admin/add_categories/data/models/create_categories_response.dart';
import '../../feature/admin/add_categories/data/models/get_all_categories_response.dart';
import '../../feature/admin/add_products/data/model/get_all_products_response.dart';
import '../../feature/admin/dashboard/data/models/categories_number_response.dart';
import '../../feature/admin/dashboard/data/models/products_number_response.dart';
import '../../feature/admin/dashboard/data/models/users_number_response.dart';
import '../../feature/admin/users/data/models/get_all_users_response.dart';
import '../../feature/auth/login/data/model/user_role_response.dart';
import '../../feature/auth/sign_up/data/model/sign_up_request_body.dart';
import '../../feature/customer/product_details/data/model/product_details_response.dart';
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

  @POST(ApiConstants.graphQl)
  Future<CategoriesResponseModel> getCategories(
    @Body() Map<String, dynamic> body,
  );

  @POST(ApiConstants.graphQl)
  Future<CreateCategoryResponse> createCategory(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(ApiConstants.graphQl)
  Future<void> deleteCategory(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(ApiConstants.graphQl)
  Future<void> updateCategory(
    @Body() Map<String, dynamic> mutation,
  );
  @POST(ApiConstants.graphQl)
  Future<GetAllProductResponse> getAllProduct(
    @Body() Map<String, dynamic> query,
  );

  @POST(ApiConstants.graphQl)
  Future<void> createProduct(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(ApiConstants.graphQl)
  Future<void> deleteProduct(
    @Body() Map<String, dynamic> mutation,
  );

  @POST(ApiConstants.graphQl)
  Future<void> updateProduct(
    @Body() Map<String, dynamic> mutation,
  );
  @POST(ApiConstants.graphQl)
  Future<GetAllUsersResponse> getAllUsers(
    @Body() Map<String, dynamic> query,
  );

  @POST(ApiConstants.graphQl)
  Future<void> deleteUser(
    @Body() Map<String, dynamic> mutation,
  );
  @POST(ApiConstants.graphQl)
  Future<ProductDetailsResponse> productDetails(
    @Body() Map<String, dynamic> query,
  );
  @POST(ApiConstants.graphQl)
  Future<GetAllProductResponse> homeCategories(
    @Body() Map<String, dynamic> query,
  );
  @POST(ApiConstants.graphQl)
  Future<GetAllProductResponse> viewAllProducts(
    @Body() Map<String, dynamic> query,
  );
  @POST(ApiConstants.graphQl)
  Future<GetAllProductResponse> searchProducts(
    @Body() Map<String, dynamic> query,
  );
}
