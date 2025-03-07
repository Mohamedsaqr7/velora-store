import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/app/bloc_observer.dart';
import 'core/app/env_variables.dart';
import 'core/constants/secure_storage.dart';
import 'core/di/dependency_injection.dart';
import 'velora_app.dart';

void main() async {
  await EnvVariable.instance.init(envtype: EnvType.dev);
  await SharedPref().instantiatePreferences();

  Bloc.observer = AppBlocObserver();
  // SharedPreferences prefs = await SharedPreferences.getInstance(); // التهيئة
  await setupInjection();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const VeloraStore());
  });
}
