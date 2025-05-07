import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/common/widgets/custom_linear_button.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/enums/nav_bar_enum.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/feature/customer/main/logic/main_cubit_cubit.dart';

class MainScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<MainCubitCubit>();
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.color.mainColor,
        elevation: 0,
        title: CustomFadeInRight(
          duration: 800,
          child: BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                if (cubit.navBarEnum == NavBarEnum.home) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomFadeInRight(
                        duration: 800,
                        child: TextApp(
                            text: context.translate(LangKeys.chooseProducts),
                            theme: context.textStyle.copyWith(
                              fontSize: 20.sp,
                              fontWeight: FontWeightHelper.bold,
                              fontFamily: FontFamily.geLocalozedFontFamily(),
                            )),
                      ),
                      CustomFadeInLeft(
                        duration: 800,
                        child: CustomLinearButton(
                          onPressed: () {
                            context.pushName(AppRoutes.search);
                          },
                          child: Center(
                            child: SvgPicture.asset(AppAssets.search),
                          ),
                        ),
                      )
                    ],
                  );
                } else if (cubit.navBarEnum == NavBarEnum.favorites) {
                  return Center(
                    child: CustomFadeInRight(
                      duration: 800,
                      child: TextApp(
                        text: 'Your Favorite',
                        theme: context.textStyle.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeightHelper.bold,
                          color: context.color.textColor,
                        ),
                      ),
                    ),
                  );
                } else if (cubit.navBarEnum == NavBarEnum.notifications) {
                  return Center(
                    child: CustomFadeInRight(
                      duration: 800,
                      child: TextApp(
                        text: 'Your Notifications',
                        theme: context.textStyle.copyWith(
                          fontSize: 20.sp,
                          fontWeight: FontWeightHelper.bold,
                          color: context.color.textColor,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
        ));
  }

  @override
  Size get preferredSize => Size(double.infinity, 80.h);
}
