import 'package:velora/core/constants/app_constants.dart';

abstract class AppAssets {
  static String splash = '${AppConstants.corePath}splash.svg';
  static String icon = '${AppConstants.corePath}icon.png';
  static String noNetwork = '${AppConstants.corePath}no_network.png';
  static String emptyScreen = '${AppConstants.corePath}emptyScreen.jpg';
  static String pageunder = '${AppConstants.corePath}page_under_build.jpg';

  static const String testDark =
      '${AppConstants.imagesPath}dark_test_image.png';
  static const String testLight =
      '${AppConstants.imagesPath}light_test_image.png';
}
