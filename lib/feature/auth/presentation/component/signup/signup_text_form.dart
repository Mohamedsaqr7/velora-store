import 'package:flutter/material.dart';
import 'package:velora/core/context/context_extension.dart';

import '../../../../../core/common/widgets/animate_do.dart';
import '../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../core/constants/app_regex.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/theme/spacing.dart';

class SignupTextForm extends StatelessWidget {
  const SignupTextForm({super.key});

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
              hintText: context.translate(LangKeys.fullName),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 4) {
                  return context.translate(LangKeys.validName);
                } else {
                  return null;
                }
              },
            ),
          ),
          verticalSpace(20),
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
          verticalSpace(20),
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
    ;
  }
}
