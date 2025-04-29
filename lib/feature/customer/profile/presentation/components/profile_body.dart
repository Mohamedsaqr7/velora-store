import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/auth/login/presentation/component/login_button.dart';
import 'package:velora/feature/customer/profile/logic/user_profile_cubit.dart';
import 'package:velora/feature/customer/profile/presentation/widgets/app_version.dart';
import 'package:velora/feature/customer/profile/presentation/widgets/build_developer.dart';
import 'package:velora/feature/customer/profile/presentation/widgets/dark_mode_changer.dart';
import 'package:velora/feature/customer/profile/presentation/widgets/user_profile_info.dart';
import 'package:velora/feature/customer/profile/presentation/widgets/user_profile_shimmer.dart';

import '../../../../../core/common/widgets/animate_do.dart';
import '../../../../../core/common/widgets/logout_button.dart';
import '../widgets/language_changer.dart';
import '../widgets/logout_widget.dart';
import '../widgets/notification_changer.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: BlocBuilder<UserProfileCubit, UserProfileState>(
                builder: (context, state) {
                  return state.when(
                    failure: (errorHandler) => const UserProfileShimmer(),
                    lodaing: () => const UserProfileShimmer(),
                    success: (userData) {
                      return UserProfileInfo(
                        userInfoData: userData,
                      );
                    },
                  );
                },
              ),
            ),
            verticalSpace(20),
            CustomFadeInRight(
              duration: 400,
              child: TextApp(
                  text: context.translate(LangKeys.applicationFeatures),
                  theme: context.textStyle.copyWith(
                      fontSize: 18.sp,
                      fontFamily: FontFamily.geLocalozedFontFamily(),
                      fontWeight: FontWeightHelper.bold)),
            ),
            verticalSpace(40),
            const CustomFadeInRight(
              duration: 400,
              child: LanguageChange(),
            ),
            verticalSpace(20),
            const CustomFadeInRight(
              duration: 400,
              child: DarkModeChange(),
            ),
            verticalSpace(20),
            const CustomFadeInRight(
              duration: 400,
              child: BuildDeveloper(),
            ),
            verticalSpace(20),
            const CustomFadeInRight(
              duration: 400,
              child: NotificationsChange(),
            ),
            verticalSpace(20),
            const CustomFadeInRight(
              duration: 400,
              child: BuildVersion(),
            ),
            verticalSpace(20),
            const CustomFadeInRight(
              duration: 400,
              child: LogOutWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
