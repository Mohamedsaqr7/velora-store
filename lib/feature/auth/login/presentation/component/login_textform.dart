import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/common/widgets/custom_text_field.dart';
import 'package:velora/core/constants/app_regex.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/auth/login/logic/login/login_cubit.dart';
import 'package:velora/feature/auth/login/logic/login/login_state.dart';

import '../../../../../core/language/lang_keys.dart';

class LoginTextformScreen extends StatefulWidget {
  const LoginTextformScreen({super.key});

  @override
  State<LoginTextformScreen> createState() => _LoginTextformScreenState();
}

class _LoginTextformScreenState extends State<LoginTextformScreen> {
  bool isShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = context.read<LoginCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              CustomFadeInRight(
                duration: 200,
                child: CustomTextField(
                  controller: cubit.emailController,
                  hintText: context.translate(LangKeys.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (!AppRegex.isEmailValid(value ?? '')) {
                      return context.translate(LangKeys.validEmail);
                    }
                    return null;
                  },
                ),
              ),
              verticalSpace(25),
              CustomFadeInRight(
                duration: 200,
                child: CustomTextField(
                  controller: cubit.passwordController,
                  hintText: context.translate(LangKeys.password),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isShowPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return context.translate(LangKeys.validPasswrod);
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      icon: Icon(
                        isShowPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: context.color.textColor,
                      )),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
