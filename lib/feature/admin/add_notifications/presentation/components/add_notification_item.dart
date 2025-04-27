import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/custom_container_linear_admin.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/extensions/date_extension.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/feature/admin/add_notifications/data/model/add_notification_model.dart';

import '../../../../../core/style/theme/spacing.dart';
import '../widgets/delete/delete_notification.dart';
import '../widgets/edit/edit_notification.dart';
import '../widgets/send/send_notification.dart';

class AddNotificationItem extends StatelessWidget {
  AddNotificationItem({required this.addNotificationModel, super.key, required this.index});
  AddNotificationModel addNotificationModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 180.h,
      width: double.infinity,
      child: Padding(
        child: Column(
          children: [
            const Spacer(),
            NotificationInfo(
                title: 'Title:',
                body: addNotificationModel.title ?? 'bodyssssss'),
            const Spacer(),
            NotificationInfo(
                title: 'Body:',
                body: addNotificationModel.body ?? 'bodyssssss'),
            const Spacer(),
            NotificationInfo(
                title: 'Created At:',
                body: addNotificationModel.createdAt.getFormatDayMonthYear() ??
                    'bodyssssss'),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DeleteNotification(
                  deleteNot: addNotificationModel,
                ),
                horizontalSpace(20),
                EditNotification(
                  addNotificationModel: addNotificationModel,
                ),
                horizontalSpace(20),
                SendNotificationWidget(
                  addNotificationModel: addNotificationModel,
                  index: index,
                )
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
