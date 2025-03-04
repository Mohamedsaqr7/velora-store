class FontFamily {
  const FontFamily._();

  static const String cairoArabic = 'Cairo';
  static const String poppinsEnglish = 'Poppins';
  ///ToDo: تبديل بين اللغات لما نضيف اللكواليزيشن
  
  static String geLocalozedFontFamily() {
    //TODO: SharedPreferences
    final currentLanguage = 'ar';
    if (currentLanguage == 'ar') {
      return cairoArabic;
    } else {
      return poppinsEnglish;
    }
  }
}
