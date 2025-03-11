import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/app/app_cubit/app_cubit.dart';
import 'package:velora/core/app/env_variables.dart';
import 'package:velora/core/constants/secure_keys.dart';
import 'package:velora/core/constants/secure_storage.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/core/style/theme/app_theme.dart';
import 'package:velora/feature/auth/sign_up/presentation/signup/signup_screen.dart';

import 'core/language/app_localization_setup.dart';

class VeloraStore extends StatelessWidget {
  const VeloraStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppCubit>()
        ..changeAppThemeMode(
            sharedMode: SharedPref().getBoolean(SecureKeys.themeMode))
        ..getSavedLanguage(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: Builder(
          builder: (context) {
            return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
              final cubit = context.read<AppCubit>();

              return MaterialApp(
                  title: 'Velora Store',
                  debugShowCheckedModeBanner: EnvVariable.instance.debugMood,
                  theme: cubit.isDark ? themeLight() : themeDark(),
                  locale: Locale(cubit.currentLangCode),
                  supportedLocales: AppLocalizationsSetup.supportedLocales,
                  // ignore: lines_longer_than_80_chars
                  localizationsDelegates:
                      AppLocalizationsSetup.localizationsDelegates,
                  // ignore: lines_longer_than_80_chars
                  localeResolutionCallback:
                      AppLocalizationsSetup.localeResolutionCallback,
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                  initialRoute: SharedPref()
                              .getString(SecureKeys.accessToken) !=
                          null
                      ? SharedPref().getString(SecureKeys.userRole) != 'admin'
                          ? AppRoutes.homeCustomer
                          : AppRoutes.homeAdmin
                      : AppRoutes.login);
            });
          },
        ),
      ),
    );
  }
}
