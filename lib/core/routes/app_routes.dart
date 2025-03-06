import 'package:flutter/material.dart';
import 'package:velora/core/routes/base_route.dart';
import 'package:velora/feature/auth/presentation/screens/login_screen.dart';

import '../common/screens/under_build_screen.dart';

class AppRoutes {
  static const String login = 'login';
  static const String test2 = 'test2';
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(page: const LoginScreen());
      // case test2:
      //   return BaseRoute(page: const Test2());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
