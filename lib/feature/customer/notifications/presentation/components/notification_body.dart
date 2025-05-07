import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/style/theme/spacing.dart';

import 'notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const NotificationItem();
          },
          separatorBuilder: (context, index) => verticalSpace(10)),
    );
  }
}
