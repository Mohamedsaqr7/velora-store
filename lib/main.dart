import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velora/core/services/hive/hive_database.dart';

import 'core/app/bloc_observer.dart';
import 'core/app/env_variables.dart';
import 'core/constants/secure_storage.dart';
import 'core/di/dependency_injection.dart';
import 'core/services/push_notifications/firebase_cloud_messaging.dart';
import 'core/services/push_notifications/local_notification_service.dart';
import 'velora_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await EnvVariable.instance.init(envtype: EnvType.dev);
  await SharedPref().instantiatePreferences();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService().init();
  // await NotificationService().deleteFCMToken();
  Bloc.observer = AppBlocObserver();
  await LocalNotificationService.init();
  await HiveDatabase.setup();
  // SharedPreferences prefs = await SharedPreferences.getInstance(); // التهيئة
  await setupInjection();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ).then((_) {
    runApp(const VeloraStore());
  });
}
