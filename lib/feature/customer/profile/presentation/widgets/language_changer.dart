
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/extensions/context_extension.dart';

import '../../../../../core/app/app_cubit/app_cubit.dart';
import '../../../../../core/common/widgets/custom_dialogs.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/language/app_localization.dart';
import '../../../../../core/language/lang_keys.dart';
import '../../../../../core/style/fonts/font_weight.dart';

class LanguageChange extends StatelessWidget {
  const LanguageChange({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return Row(
          children: [
            SvgPicture.asset(
              AppAssets.language,
              color: context.color.textColor,
            ),
            SizedBox(width: 10.w),
            TextApp(
              text: context.translate(LangKeys.languageTilte),
              theme: context.textStyle.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeightHelper.regular,
              ),
            ),
            const Spacer(),
            //language button
            InkWell(
              onTap: () {
                //dialog
                CustomDialog.twoButtonDialog(
                  context: context,
                  textBody: context.translate(LangKeys.changeToTheLanguage),
                  textButton1: context.translate(LangKeys.sure),
                  textButton2: context.translate(LangKeys.cancel),
                  isLoading: false,
                  onPressed: () {
                    selectLanguagesButton(context: context, cubit: cubit);
                  },
                );
              },
              child: Row(
                children: [
                  TextApp(
                    text: context.translate(LangKeys.langCode),
                    theme: context.textStyle.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeightHelper.regular,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: context.color.textColor,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void selectLanguagesButton({
    required BuildContext context,
    required AppCubit cubit,
  }) {
    if (AppLocalizations.of(context)!.isEnLocale) {
      cubit.toArabic();
    } else {
      cubit.toEnglish();
    }
    context.pop();
  }
}