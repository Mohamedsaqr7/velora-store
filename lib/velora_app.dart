import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/app/internet_connection.dart';
import 'package:velora/core/app/env_variables.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/core/style/theme/app_theme.dart';

import 'core/common/screens/no_network_screen.dart';
import 'core/language/app_localization_setup.dart';

class VeloraStore extends StatelessWidget {
  const VeloraStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Velora Store',
            debugShowCheckedModeBanner: EnvVariable.instance.debugMood,
            theme: themeDark(),
            locale: Locale('en'),
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            // ignore: lines_longer_than_80_chars
            localizationsDelegates:
                AppLocalizationsSetup.localizationsDelegates,
            // ignore: lines_longer_than_80_chars
            localeResolutionCallback:
                AppLocalizationsSetup.localeResolutionCallback,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: AppRoutes.login,
            builder: (context, child) {
              return StreamBuilder<bool>(
                stream: InternetChecker().onConnectionChange,
                builder: (context, snapshot) {
                  final isConnected = snapshot.data ?? false;
                  if (isConnected) {
                    return const NoNetworkScreen();
                  }
                  return child!;
                },
              );
            },
          );
        },
      ),
    );
  }
}
