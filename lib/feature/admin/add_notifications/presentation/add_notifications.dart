import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/networking/push_notifications/firebase_cloud_messaging.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/customer/s.dart';

import '../../../../core/common/widgets/admin_app_bar.dart';

class AddNotifications extends StatelessWidget {
  const AddNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
          isMain: true,
          title: 'Notifications',
          backgroundColor: context.color.mainColor!.withOpacity(1)),
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                final token = await FirebaseMessaging.instance.getToken();
                print('token: $token');
                //  NotificationService.sendNotification(
                //   'fFRJkwRFSsGcgUpO6UEVSu:APA91bFw4lAlNT3XKaRbfVTC_RkY6J22EhyRZgAoYquvA0eFXaQ1pVytK9pWyjGbT_jEqhTayRI3IK-BO-9lJIPBIxs35PL5aW40cp5Kv4xONqhJisWZUP8',
                //   'body',
                //   'title',
                // );
              },
              child: Text(
                'get token Notifications ',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            verticalSpace(20),
            InkWell(
              onTap: () async {
                NotificationService.sendNotification(
                  'title',
                  'body',
                  -1
                );
                print(
                    'send notification: ${NotificationService.sendNotification.toString()}');
              },
              child: Text(
                'send Notificatisons/// ',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const cust(),
                    ));
                // NotificationService.sendNotification();
              },
              child: Text(
                'back ',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
