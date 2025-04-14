import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/custom_container_linear_admin.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';

import '../../../../../core/style/theme/spacing.dart';

class AddNotificationItem extends StatelessWidget {
  const AddNotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: double.infinity,
      child: Padding(
        child: Column(
          children: [
            const Spacer(),
            NotificationInfo(title: 'Title:', body: 'bodyssssss'),
            const Spacer(),
            NotificationInfo(title: 'Body:', body: 'bodyssssss'),
            const Spacer(),
            NotificationInfo(title: 'Created At:', body: 'bodyssssss'),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
                horizontalSpace(20),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Colors.yellow,
                  ),
                ),
                horizontalSpace(20),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      ),
    );
  }
}

class NotificationInfo extends StatelessWidget {
  const NotificationInfo({super.key, required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextApp(
          text: title,
          theme: context.textStyle.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.medium,
            color: context.color.textColor,
            fontFamily: FontFamily.geLocalozedFontFamily(),
          ),
        ),
        horizontalSpace(10.w),
        Flexible(
          child: TextApp(
            text: body,
            theme: context.textStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeightHelper.medium,
              color: context.color.bluePinkLight,
              fontFamily: FontFamily.geLocalozedFontFamily(),
            ),
          ),
        ),
      ],
    );
  }
}
