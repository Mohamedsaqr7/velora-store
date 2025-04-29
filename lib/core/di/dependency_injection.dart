import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:velora/core/networking/api_service.dart';
import 'package:velora/core/networking/dio_factory.dart';
import 'package:velora/feature/admin/add_categories/logic/create_category/create_category_cubit.dart';
import 'package:velora/feature/admin/add_categories/logic/delete_category/delete_category_cubit.dart';
import 'package:velora/feature/admin/add_categories/logic/get_category/get_categories_cubit.dart';
import 'package:velora/feature/admin/add_categories/logic/update_category/update_category_cubit.dart';
import 'package:velora/feature/admin/add_notifications/data/repo/notification_repo.dart';
import 'package:velora/feature/admin/add_notifications/logic/add_nots/add_notification_cubit.dart';
import 'package:velora/feature/admin/add_notifications/logic/send_notification/send_notification_cubit.dart';
import 'package:velora/feature/admin/add_products/logic/create_product/create_product_cubit.dart';
import 'package:velora/feature/admin/dashboard/logic/categories_number_cubit/categories_cubit.dart';
import 'package:velora/feature/admin/dashboard/logic/products_number_cubit/product_cubit.dart';
import 'package:velora/feature/admin/dashboard/logic/users_number_cubit/users_cubit.dart';
import 'package:velora/feature/admin/users/data/repo/users_repo.dart';
import 'package:velora/feature/admin/users/logic/get_users/get_users_cubit.dart';
import 'package:velora/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:velora/feature/customer/home/data/repo/customer_home_repo.dart';
import 'package:velora/feature/customer/home/logic/categories/fetch_categories_cubit.dart';
import 'package:velora/feature/customer/home/logic/products/fetch_products_cubit.dart';
import 'package:velora/feature/customer/main/logic/main_cubit_cubit.dart';
import 'package:velora/feature/customer/profile/data/repos/profile_repo.dart';
import 'package:velora/feature/customer/profile/logic/user_profile_cubit.dart';

import '../../feature/admin/add_categories/data/repos/cateories_admin_repo.dart';
import '../../feature/admin/add_notifications/logic/get_nots/get_notification_cubit.dart';
import '../../feature/admin/add_products/data/repo/produccts_repo.dart';
import '../../feature/admin/add_products/logic/get_all_products/get_all_products_cubit.dart';
import '../../feature/admin/dashboard/data/repo/dashboard_repo.dart';
import '../../feature/admin/users/logic/delete_user/delete_user_cubit.dart';
import '../../feature/auth/login/data/repo/login_repo.dart';
import '../../feature/auth/login/logic/login/login_cubit.dart';
import '../../feature/auth/sign_up/data/repo/sign_up_repo.dart';
import '../../feature/customer/product_details/data/repo/product_details_repo.dart';
import '../../feature/customer/product_details/logic/product_details_cubit.dart';
import '../app/app_cubit/app_cubit.dart';
import '../app/bloc_observer.dart';
import '../app/upload_image/cubit/upload_cubit.dart';
import '../app/upload_image/repo/upload_image_repo.dart';

final getIt = GetIt.instance;
Future<void> setupInjection() async {
  getIt.registerFactory<AppCubit>(() => AppCubit());
  //dio & api service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  final navigatorKey = GlobalKey<NavigatorState>();
  getIt
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)

    //login(repo & cubit)
    ..registerFactory<LoginRepo>(() => LoginRepo(getIt<ApiService>()))
    ..registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()))
//upload image(repo & cubit)

    ..registerLazySingleton<UploadImageRepo>(
      () => UploadImageRepo(getIt<ApiService>()),
    )
    ..registerFactory<UploadImageCubit>(
      () => UploadImageCubit(getIt<UploadImageRepo>()),
    )
    //signup(repo & cubit)
    ..registerFactory<SignUpRepo>(() => SignUpRepo(getIt<ApiService>()))
    ..registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpRepo>()))
    //dashboard
    ..registerLazySingleton<DashboardRepo>(
      () => DashboardRepo(getIt<ApiService>()),
    )
    ..registerFactory<ProductCubit>(
      () => ProductCubit(getIt<DashboardRepo>()),
    )
    ..registerFactory<CategoriesCubit>(
      () => CategoriesCubit(getIt<DashboardRepo>()),
    )
    ..registerFactory<UsersCubit>(
      () => UsersCubit(getIt<DashboardRepo>()),
    )
    //get category
    ..registerFactory<CategoreisAdminRepo>(
        () => CategoreisAdminRepo(getIt<ApiService>()))
    ..registerFactory<GetCategoriesCubit>(
        () => GetCategoriesCubit(getIt<CategoreisAdminRepo>()))
    //create category
    ..registerFactory<CreateCategoryCubit>(
        () => CreateCategoryCubit(getIt<CategoreisAdminRepo>()))
    //delete category
    ..registerFactory<DeleteCategoryCubit>(
        () => DeleteCategoryCubit(getIt<CategoreisAdminRepo>()))
    //update category
    ..registerFactory<UpdateCategoryCubit>(
        () => UpdateCategoryCubit(getIt<CategoreisAdminRepo>()))
    //get product
    ..registerLazySingleton<ProductsRepo>(
      () => ProductsRepo(getIt<ApiService>()),
    )
    ..registerFactory<GetAllProductsCubit>(
        () => GetAllProductsCubit(getIt<ProductsRepo>()))
    //create product
    ..registerFactory<CreateProductCubit>(
        () => CreateProductCubit(getIt<ProductsRepo>()))
    //get users
    ..registerLazySingleton<UsersRepo>(
      () => UsersRepo(getIt<ApiService>()),
    )
    ..registerFactory<GetUsersCubit>(() => GetUsersCubit(getIt<UsersRepo>()))
    ..registerFactory<DeleteUserCubit>(
        () => DeleteUserCubit(getIt<UsersRepo>()))
    ..registerFactory<AddNotificationCubit>(AddNotificationCubit.new)
    ..registerFactory<GetNotificationCubit>(GetNotificationCubit.new)
    ..registerLazySingleton<NotificationsRepo>(
      NotificationsRepo.new,
    )
    ..registerFactory<SendNotificationCubit>(
        () => SendNotificationCubit(getIt<NotificationsRepo>()))
    ..registerFactory(MainCubitCubit.new)
    ..registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt<ApiService>()))
    ..registerFactory<UserProfileCubit>(
        () => UserProfileCubit(getIt<ProfileRepo>()))
    ..registerLazySingleton<CustomerHomeRepo>(
        () => CustomerHomeRepo(getIt<ApiService>()))
    ..registerFactory<FetchCategoriesCubit>(
        () => FetchCategoriesCubit(getIt<CustomerHomeRepo>()))
    ..registerFactory<FetchProductsCubit>(
        () => FetchProductsCubit(getIt<CustomerHomeRepo>()))
    ..registerLazySingleton<ProductDetailsRepo>(
        () => ProductDetailsRepo(getIt<ApiService>()))
    ..registerFactory<ProductDetailsCubit>(
        () => ProductDetailsCubit(getIt<ProductDetailsRepo>()));
}
