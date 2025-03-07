import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:velora/core/networking/api_service.dart';
import 'package:velora/core/networking/dio_factory.dart';

import '../app/app_cubit/app_cubit.dart';
import '../app/bloc_observer.dart';

final sl = GetIt.instance;
Future<void> setupInjection() async {
  await _initCore();
}

Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  sl
   ..registerFactory(AppCubit.new)
   ..registerLazySingleton<ApiService>(() => ApiService(dio));
}
