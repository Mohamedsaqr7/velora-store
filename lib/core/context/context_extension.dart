import 'package:flutter/material.dart';
import 'package:velora/core/style/theme/image_extension.dart';

import '../language/app_localization.dart';
import '../style/theme/color_extention.dart';

extension ContextExt on BuildContext {
  //color

  MyColors get color => Theme.of(this).extension<MyColors>()!;
//images
  MyAssets get images => Theme.of(this).extension<MyAssets>()!; //Language
  String translate(String langkey) {
    return AppLocalizations.of(this)!.translate(langkey).toString();
  }
  //style
    TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;

//navigation
  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() => Navigator.of(this).pop();
}
