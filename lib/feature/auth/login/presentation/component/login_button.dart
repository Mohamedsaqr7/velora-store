import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/common/widgets/custom_linear_button.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/feature/auth/login/logic/login/login_cubit.dart';
import 'package:velora/feature/auth/login/logic/login/login_state.dart';
import 'package:velora/core/common/widgets/show_toast.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext contexdt) {
    return BlocConsumer<LoginCubit, LoginState>(
     listener: (context, state) {
          state.whenOrNull(
            failure: (message) {
              ShowToast.showFailureToast(
                context.translate(LangKeys.loggedError),
              );
            },
            success: (userRole) {
              ShowToast.showSuccessToast(
                context.translate(LangKeys.loggedSuccessfully),
              );
              if (userRole == 'admin') {
                context.pushNamedAndRemoveUntil(AppRoutes.homeAdmin);
              } else if(userRole=='customer'){
                context.pushNamedAndRemoveUntil(AppRoutes.homeCustomer);
              }
            },
          );
        },
      builder: (context, state) {
        return CustomFadeInRight(
          duration: 400,
          child: CustomLinearButton(
            width: double.infinity,
            height: 50,
            onPressed: () {
              validateThenDoLogin(contexdt);
            },
            child: TextApp(
                text: "login",
                theme: contexdt.textStyle.copyWith(
                    fontSize: 18.sp, fontWeight: FontWeightHelper.bold)),
          ),
        );
      },
    );
    // return state.maybeWhen(
    //   loading: () {
    //     return CustomLinearButton(
    //       onPressed: () {},
    //       height: 50.h,
    //       width: MediaQuery.of(context).size.width,
    //       child: const CircularProgressIndicator(
    //         color: Colors.white,
    //       ),
    //     );
    //   },
    //   orElse: () {
    //     return CustomFadeInRight(
    //       duration: 400,
    //       child: CustomLinearButton(
    //         width: double.infinity,
    //         height: 50,
    //         onPressed: () {
    //           validateThenDoLogin(context);
    //         },
    //         child: TextApp(
    //             text: context.translate(LangKeys.login),
    //             theme: context.textStyle.copyWith(
    //                 fontSize: 18.sp, fontWeight: FontWeightHelper.bold)),
    //       ),
    //     );
    //   },
    // );
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().emitLoginStates();
  }
}
