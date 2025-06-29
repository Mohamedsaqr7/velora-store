import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/feature/auth/sign_up/presentation/signup/component/signup_button.dart';
import 'package:velora/feature/auth/sign_up/presentation/signup/component/signup_text_form.dart';
import 'package:velora/feature/auth/sign_up/presentation/signup/component/user_avatar.dart';

import '../../../../../../core/common/widgets/animate_do.dart';
import '../../../../../../core/language/lang_keys.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/style/fonts/font_weight.dart';
import '../../../../../../core/style/theme/spacing.dart';
import '../../../../../../core/common/widgets/auth_title_info.dart';
import '../../../../../../core/common/widgets/dark_and_lang_buttons.dart';

class SignUpBodyScreen extends StatelessWidget {
  const SignUpBodyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DarkAndLangButtons(),
            verticalSpace(20),
            AuthTitleInfo(
              title: context.translate(LangKeys.signUp),
              description: context.translate(LangKeys.signUpWelcome),
            ),
            verticalSpace(10),
            const UserAvatarScreen(),
            verticalSpace(10),
            const SignupTextForm(),
            verticalSpace(15),
            const SignupButton(),
            verticalSpace(10),
            CustomFadeInDown(
              duration: 400,
              child: TextButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRoutes.login);
                },
                child: TextApp(
                  text: context.translate(LangKeys.youHaveAccount),
                  theme: context.textStyle.copyWith(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 16.sp,
                      color: context.color.bluePinkLight),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
