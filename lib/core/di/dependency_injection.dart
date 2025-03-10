import 'dart:async';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:velora/core/networking/api_service.dart';
import 'package:velora/core/networking/dio_factory.dart';

import '../../feature/auth/login/data/repo/login_repo.dart';
import '../../feature/auth/login/logic/login/login_cubit.dart';
import '../app/app_cubit/app_cubit.dart';
import '../app/bloc_observer.dart';

final getIt = GetIt.instance;
Future<void> setupInjection() async {
  getIt.registerFactory<AppCubit>(() => AppCubit());
  //dio & api service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //login(repo & cubit)
  getIt.registerFactory<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
