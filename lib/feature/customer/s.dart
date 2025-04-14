import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/networking/push_notifications/firebase_cloud_messaging.dart';
import 'package:velora/core/routes/app_routes.dart';

class cust extends StatelessWidget {
  const cust({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.theme.mainColor!.withOpacity(1),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                // await NotificationService().subscribeNotification();
              },
              child: Text(
                'subs ',
                style: TextStyle(color: Colors.yellow, fontSize: 20),
              ),
            ),
            InkWell(
              onTap: () async {
                // await NotificationService().unSubscribeNotification();

                context.pushName(AppRoutes.homeAdmin);
              },
              child: Text(
                'unsubs ',
                style: TextStyle(color: Colors.yellow, fontSize: 20),
              ),
            ),
          ],
        ),
        //     ValueListenableBuilder(
        //   valueListenable: NotificationService().isNotificationSubscribe,
        //   builder: (_, value, __) {
        //     return Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(
        //           value ? 'Subscribe🔔' : 'Unsubscribe🔕',
        //           style: const TextStyle(
        //             fontSize: 24,
        //             color: Colors.white,
        //           ),
        //         ),
        //         const SizedBox(width: 20),
        //         Transform.scale(
        //           scale: 1.4,
        //           child: Switch.adaptive(
        //             value: value,
        //             inactiveTrackColor: const Color(0xff262626),
        //             activeColor: Colors.green,
        //             onChanged: (value) async {
        //               await NotificationService().controllerForUserSubscribe();
        //             },
        //           ),
        //         ),
        //       ],
        //     );
        //   },
        // ),
      ),
    );
  }
}
