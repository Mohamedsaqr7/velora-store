import 'package:flutter/material.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/common/widgets/custom_text_field.dart';
import 'package:velora/core/constants/app_regex.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/style/theme/spacing.dart';

import '../../../../core/language/lang_keys.dart';

class LoginTextformScreen extends StatelessWidget {
  const LoginTextformScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Text('data'),
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: context.translate(LangKeys.email),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (AppRegex.isEmailValid('email')) {
                  return context.translate(LangKeys.validEmail);
                } else {
                  return null;
                }
              },
            ),
          ),
          verticalSpace(25),
          CustomFadeInRight(
            duration: 200,
            child: CustomTextField(
              controller: TextEditingController(),
              hintText: context.translate(LangKeys.password),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 6) {
                  return context.translate(LangKeys.validEmail);
                } else {
                  return null;
                }
              },
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.visibility_off,
                    color: context.color.textColor,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
