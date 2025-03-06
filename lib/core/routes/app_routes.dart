import 'package:flutter/material.dart';
import 'package:velora/core/routes/base_route.dart';
import 'package:velora/feature/auth/presentation/screens/login_screen.dart';
import 'package:velora/feature/auth/presentation/screens/signup_screen.dart';

import '../common/screens/under_build_screen.dart';

class AppRoutes {
  static const String login = 'login';
  static const String signUp = 'signUp';
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case login:
        return BaseRoute(page: const LoginScreen());
      case signUp:
        return BaseRoute(page: const SignupScreen());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
