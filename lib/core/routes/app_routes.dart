import 'package:flutter/material.dart';
import 'package:velora/core/routes/base_route.dart';

import '../common/under_build_screen.dart';
import '../test1.dart';
import '../test2.dart';

class AppRoutes {
  static const String test1 = 'test1';
  static const String test2 = 'test2';
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case test1:
        return BaseRoute(page: const Test1());
      case test2:
        return BaseRoute(page: const Test2());
      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}