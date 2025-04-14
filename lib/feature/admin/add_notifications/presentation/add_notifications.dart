import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/networking/push_notifications/firebase_cloud_messaging.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/customer/s.dart';

import '../../../../core/common/widgets/admin_app_bar.dart';
import 'components/add_notification_body.dart';

class AddNotifications extends StatelessWidget {
  const AddNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
          isMain: true,
          title: 'Notifications',
          backgroundColor: context.color.mainColor!.withOpacity(1)),
      body: AddNotificationBody()
    );
  }
}
