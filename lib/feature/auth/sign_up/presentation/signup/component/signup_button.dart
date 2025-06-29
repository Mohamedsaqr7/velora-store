import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:velora/feature/auth/sign_up/logic/sign_up_state.dart';

import '../../../../../../core/app/upload_image/cubit/upload_cubit.dart';
import '../../../../../../core/common/widgets/animate_do.dart';
import '../../../../../../core/common/widgets/custom_linear_button.dart';
import '../../../../../../core/common/widgets/show_toast.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/routes/app_routes.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignupState>(listener: (context, state) {
      state.mapOrNull(
        signupError: (message) {
          ShowToast.showFailureToast(
            context.translate(LangKeys.signUp),
          );
        },
        signupSuccess: (_) {
          ShowToast.showSuccessToast(
            context.translate(LangKeys.signUpWelcome),
          );
          context.pushNamedAndRemoveUntil(AppRoutes.login);
        },
      );
    }, builder: (context, snapshot) {
      return snapshot.maybeWhen(
          signupLoading: () => CustomLinearButton(
                onPressed: () {},
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
          orElse: () {
            return CustomFadeInRight(
              duration: 600,
              child: CustomLinearButton(
                onPressed: () {
                  _validateThenDoSignUp(context);
                },
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                child: TextApp(
                  text: context.translate(LangKeys.signUp),
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ),
            );
          });
    });
  }
}

void _validateThenDoSignUp(BuildContext context) {
  final signcubit = context.read<SignUpCubit>();
  final imageCubit = context.read<UploadImageCubit>();

  if (!signcubit.formKey.currentState!.validate() ||
      imageCubit.uploadImageUrl.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.translate(LangKeys.validPickImage))));
  } else {
    signcubit.emitSignupStates(imageUrl: imageCubit.uploadImageUrl);
  }
}

        // return CustomFadeInRight(
        //   duration: 400,
        //   child: CustomLinearButton(
        //     width: double.infinity,
        //     height: 50,
        //     onPressed: () {},
        //     child: TextApp(
        //         text: context.translate(LangKeys.signUp),
        //         theme: context.textStyle
        //             .copyWith(fontSize: 18.sp, fontWeight: FontWeightHelper.bold)),
        //   ),
        // );