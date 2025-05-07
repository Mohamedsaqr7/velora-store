import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/core/style/theme/spacing.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      isThreeLine: true,
      onTap: () {},
      leading: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppAssets.notificationIcon,
            color: context.color.notColor,
            height: 30.h,
          ),
        ),
      ),
      //Title
      title: TextApp(
        text: 'title',
        theme: context.textStyle.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeightHelper.medium,
          color: Colors.white,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(5),
          //Body
          TextApp(
            text: 'Body',
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.medium,
              color: Colors.white,
            ),
          ),
          verticalSpace(5),
          //created at
          TextApp(
            text: 'Created At',
            theme: context.textStyle.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeightHelper.medium,
              color: Colors.white,
            ),
          ),
          verticalSpace(5),
          Divider(
            color: Colors.white,
          ),
        ],
      ),
      trailing: GestureDetector(
        onTap: () {},
        child: const Icon(
          Icons.close,
          color: Colors.yellow,
          size: 20,
        ),
      ),
    );
  }
}
