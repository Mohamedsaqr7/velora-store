import 'package:flutter/material.dart';
import 'package:velora/core/constants/secure_keys.dart';
import 'package:velora/core/constants/secure_storage.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/core/extensions/context_extension.dart';

import '../routes/app_routes.dart';

class AppLogout {
  factory AppLogout() {
    return _instance;
  }
  AppLogout._();
  static final AppLogout _instance = AppLogout._();
  Future<void> logOut() async {
    final context = getIt<GlobalKey<NavigatorState>>().currentState!.context;
    await SharedPref().removePreference(SecureKeys.accessToken);
    await SharedPref().removePreference(SecureKeys.userId);
    await SharedPref().removePreference(SecureKeys.userRole);
    if (!context.mounted) return;
    await context.pushNamedAndRemoveUntil(
      AppRoutes.login,
    );
  }
}
