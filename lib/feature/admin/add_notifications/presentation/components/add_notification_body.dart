import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/style/theme/spacing.dart';

import '../widgets/create/create_notification.dart';
import 'add_notification_item.dart';

class AddNotificationBody extends StatelessWidget {
  const AddNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        children: [
          CreateNotification(),
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: verticalSpace(20),
              ),
              SliverToBoxAdapter(
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return const AddNotificationItem();
                    },
                    separatorBuilder: (context, index) => verticalSpace(15),
                    itemCount: 4),
              )
            ],
          ))
        ],
      ),
    );
  }
}
