import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:badges/badges.dart' as badges;
import 'package:velora/core/style/fonts/font_weight.dart';

class NotificationBarIcon extends StatelessWidget {
  const NotificationBarIcon({
    required this.isSelected,
    super.key,
    required this.onTap,
  });
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: badges.Badge(
        showBadge: true,
        badgeAnimation: const badges.BadgeAnimation.scale(),
        position: badges.BadgePosition.topEnd(top: -8.h, end: -4.w),
        badgeContent: TextApp(
          text: '9',
          theme: context.textStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeightHelper.bold,
              fontSize: 11.sp),
          textAlign: TextAlign.center,
        ),
        badgeStyle: badges.BadgeStyle(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            badgeColor: Colors.pink,
            elevation: 0),
        child: SvgPicture.asset(
          AppAssets.notificationIcon,
          color: isSelected ? context.color.navBarSelectedTab : Colors.grey,
          height: 25.h,
        ).animate(target: isSelected ? 1 : 0).scaleXY(end: 1.2),
      ),
    );
  }
}
