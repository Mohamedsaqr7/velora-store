import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/common/widgets/custom_linear_button.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/style/fonts/font_weight.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 400,
      child: CustomLinearButton(
        width: double.infinity,
        height: 50,
        onPressed: () {},
        child: TextApp(
            text: context.translate(LangKeys.login),
            theme: context.textStyle
                .copyWith(fontSize: 18.sp, fontWeight: FontWeightHelper.bold)),
      ),
    );
  }
}
