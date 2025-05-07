import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/enums/nav_bar_enum.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/customer/main/logic/main_cubit_cubit.dart';
import 'package:velora/feature/customer/main/presentation/widgets/nav_bar_icons.dart';
import 'package:velora/feature/customer/main/presentation/widgets/notification_bar_icon.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 800,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 110.h,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  verticalSpace(19),
                  BlocBuilder<MainCubitCubit, MainCubitState>(
                    builder: (context, state) {
                      final cubit = context.read<MainCubitCubit>();
                      return Container(
                        height: 85.h,
                        color: context.color.navBarbg,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            height: 45.h,
                            width: 300.w,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.r),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconTapNavBar(
                                      onTap: () {
                                        cubit.selectedNavBarIcons(
                                            NavBarEnum.home);
                                      },
                                      icon: AppAssets.homeTab,
                                      isSelected:
                                          cubit.navBarEnum == NavBarEnum.home),
                                  NotificationBarIcon(
                                      onTap: () {
                                        cubit.selectedNavBarIcons(
                                            NavBarEnum.notifications);
                                      },
                                      isSelected: cubit.navBarEnum ==
                                          NavBarEnum.notifications),
                                  IconTapNavBar(
                                      onTap: () {
                                        cubit.selectedNavBarIcons(
                                            NavBarEnum.favorites);
                                      },
                                      icon: AppAssets.favouritesTab,
                                      isSelected: cubit.navBarEnum ==
                                          NavBarEnum.favorites),
                                  IconTapNavBar(
                                      onTap: () {
                                        cubit.selectedNavBarIcons(
                                            NavBarEnum.profile);
                                      },
                                      icon: AppAssets.profileTab,
                                      isSelected: cubit.navBarEnum ==
                                          NavBarEnum.profile),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Positioned(
                  top: 5,
                  left: -8,
                  child: InkWell(
                    onTap: () {
                      context.pushName(AppRoutes.cart);
                    },
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(context.images.bigNavBar!))),
                    ),
                  )),
              Positioned(
                  top: 25,
                  left: 31,
                  child: SvgPicture.asset(
                    AppAssets.carShop,
                    color: Colors.white,
                    height: 22.h,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
