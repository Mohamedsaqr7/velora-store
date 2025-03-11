import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:velora/core/networking/api_service.dart';
import 'package:velora/core/networking/dio_factory.dart';
import 'package:velora/feature/auth/sign_up/logic/sign_up_cubit.dart';

import '../../feature/auth/login/data/repo/login_repo.dart';
import '../../feature/auth/login/logic/login/login_cubit.dart';
import '../../feature/auth/sign_up/data/repo/sign_up_repo.dart';
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
  //login(repo & cubit)
  getIt
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
    ..registerFactory<SignUpCubit>(() => SignUpCubit(getIt<SignUpRepo>()));
}
