import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/constants/secure_keys.dart';
import 'package:velora/core/constants/secure_storage.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/core/common/widgets/custom_dialogs.dart';

import '../../../../../../core/services/hive/hive_database.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.logout,
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.logOut),
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
              textBody: context.translate(LangKeys.logOutFromApp),
              textButton1: context.translate(LangKeys.yes),
              textButton2: context.translate(LangKeys.no),
              isLoading: false,
              onPressed: () 
               async {
            final navigator = Navigator.of(context);
            await SharedPref().removePreference(SecureKeys.accessToken);
            await SharedPref().removePreference(SecureKeys.userId);
            await SharedPref().removePreference(SecureKeys.userRole);
                await HiveDatabase().clearAllBox();

            await navigator.pushNamedAndRemoveUntil(
              AppRoutes.login,
              (route) => false,
            );
          
              },
            );
          },
          child: Row(
            children: [
              TextApp(
                text: context.translate(LangKeys.logOut).toLowerCase(),
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
  }
}