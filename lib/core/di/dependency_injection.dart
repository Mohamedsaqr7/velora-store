import 'dart:async';
import 'package:get_it/get_it.dart';

import '../app/app_cubit/app_cubit.dart';
import '../app/bloc_observer.dart';

final sl = GetIt.instance;
Future<void> setupInjection() async {
  await _initCore();
}

Future<void> _initCore() async {
  sl.registerFactory<AppCubit>(() => AppCubit());
  sl.registerLazySingleton<AppBlocObserver>(() => AppBlocObserver());
}
