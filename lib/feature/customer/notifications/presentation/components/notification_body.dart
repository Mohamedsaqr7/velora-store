import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/constants/app_constants.dart';
import 'package:velora/core/constants/secure_keys.dart';
import 'package:velora/core/constants/secure_storage.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/customer/notifications/data/model/notification_model.dart';
import 'package:velora/feature/customer/notifications/data/notification_controller.dart';

import 'notification_item.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: StreamBuilder<List<NotificationModel>>(
        stream: NotificationController().getNotificationList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notification_add,
                    color: context.color.textColor,
                    size: 150,
                  ),
                  TextApp(
                    text: 'You Not Has Notifications Now',
                    theme: context.textStyle.copyWith(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return NotificationItem(
                body: snapshot.data![index].body,
                title: snapshot.data![index].title,
                isSeen: snapshot.data![index].isSeen,
                createdAt: snapshot.data![index].createdAt,
                onTapSelected: () async {
                  await FirebaseFirestore.instance
                      .collection(usersCollection)
                      .doc(SharedPref().getInt(SecureKeys.userId).toString())
                      .collection(notificationCollection)
                      .doc(snapshot.data![index].notificationId)
                      .update({'isSeen': true});

                  if (snapshot.data![index].productId != -1) {
                    if (!context.mounted) return;
                    await context.pushName(
                      AppRoutes.productDetails,
                      arguments: snapshot.data![index].productId,
                    );
                  }
                },
                onTapRemoved: () async {
                  await FirebaseFirestore.instance
                      .collection(usersCollection)
                      .doc(SharedPref().getInt(SecureKeys.userId).toString())
                      .collection(notificationCollection)
                      .doc(snapshot.data![index].notificationId)
                      .delete();
                },
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 10.h,
            ),
          );
        },
      ),
    );
  }
}
