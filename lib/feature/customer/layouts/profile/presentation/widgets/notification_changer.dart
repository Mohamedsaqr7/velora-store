import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/services/push_notifications/firebase_cloud_messaging.dart';
import 'package:velora/core/style/fonts/font_weight.dart';


class NotificationsChange extends StatelessWidget {
  const NotificationsChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.notifications_active,
          color: context.color.textColor,
        ),
        SizedBox(width: 10.w),
        TextApp(
          text: context.translate(LangKeys.notifications),
          theme: context.textStyle.copyWith(
            fontSize: 18.sp,
            fontWeight: FontWeightHelper.regular,
          ),
        ),
        const Spacer(),

        // radio buttons
        ValueListenableBuilder(
          valueListenable: NotificationService().isNotificationSubscribe,
          builder: (_, value, __) {
            return Transform.scale(
              scale: 0.75,
              child: Switch.adaptive(
                value: value,
                inactiveTrackColor: const Color(0xff262626),
                activeColor: Colors.green,
                onChanged: (value) {
                  NotificationService().controllerForUserSubscribe(context);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
