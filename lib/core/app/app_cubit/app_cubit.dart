import 'dart:ffi';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/core/constants/secure_keys.dart';
import 'package:velora/core/constants/secure_storage.dart';
part 'app_cubit.freezed.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState.initial());
  bool isDark = true;

  //theme change
  Future<void> changeAppThemeMode({bool? sharedMode}) async {
    if (sharedMode != null) {
      isDark = sharedMode;
      emit(AppState.themeChangeMode(isDark: isDark));
    } else {
      isDark = !isDark;
      await SharedPref().setBoolean(SecureKeys.themeMode, isDark).then((value) {
        emit(AppState.themeChangeMode(isDark: isDark));
      });
    }
  }

//language change
  String currentLangCode = 'en';
  void getSavedLanguage() {
    final reslt = SharedPref().containPreference(SecureKeys.language)
        ? SharedPref().getString(SecureKeys.language)
        : 'en';
    currentLangCode = reslt!;
    emit(AppState.langChangeMode(locle: Locale(currentLangCode)));
  }

  void toogleLanguage(String langCode) {
    currentLangCode = langCode;
    SharedPref().setString(SecureKeys.language, langCode).then((value) {
      emit(AppState.langChangeMode(locle: Locale(langCode)));
    });
  }

  void toArabic() {
    toogleLanguage('ar');
  }

  void toEnglish() {
    toogleLanguage('en');
  }

  // void toArabic() {
  //   _toggleLanguage('ar');
  // }

  // void toEnglish() {
  //   _toggleLanguage('en');
  // }
}
