import 'package:velora/core/constants/secure_keys.dart';

import '../../constants/secure_storage.dart';

class FontFamily {
  const FontFamily._();

  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';

  ///ToDo: تبديل بين اللغات لما نضيف اللكواليزيشن
  static String geLocalozedFontFamily() {
    final currentLanguage = SharedPref().getString(SecureKeys.language);
    if (currentLanguage == 'ar') {
      return cairoArabic;
    } else {
      return poppinsEnglish;
    }
  }
}
