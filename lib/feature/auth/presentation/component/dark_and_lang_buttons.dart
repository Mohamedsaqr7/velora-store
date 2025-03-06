import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/common/widgets/custom_linear_button.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';

class DarkAndLangButtons extends StatelessWidget {
  const DarkAndLangButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFadeInRight(
          duration: 400,
          child: CustomLinearButton(
            onPressed: () {},
            child: Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
        ),
        CustomFadeInLeft(
          duration: 400,
          child: CustomLinearButton(
              height: 40.h,
              width: 100.w,
              onPressed: () {},
              child: TextApp(
                  text: context.translate(LangKeys.language),
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ))),
        )
      ],
    );
  }
}
