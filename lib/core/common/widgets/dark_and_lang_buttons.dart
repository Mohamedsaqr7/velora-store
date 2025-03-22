import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/app/app_cubit/app_cubit.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/common/widgets/custom_linear_button.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/language/app_localization.dart';
import 'package:velora/core/language/lang_keys.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomFadeInRight(
              duration: 400,
              child: CustomLinearButton(
                onPressed: cubit.changeAppThemeMode,
                child: Icon(
                  cubit.isDark ? Icons.light_mode : Icons.dark_mode,
                  color: Colors.white,
                ),
              ),
            ),
            CustomFadeInLeft(
              duration: 400,
              child: CustomLinearButton(
                height: 40.h,
                width: 100.w,
                onPressed: () {
                  if (AppLocalizations.of(context)!.isEnLocale) {
                    cubit.toArabic();
                  } else {
                    cubit.toEnglish();
                  }
                },
                child: TextApp(
                  text: context.translate(LangKeys.language),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
