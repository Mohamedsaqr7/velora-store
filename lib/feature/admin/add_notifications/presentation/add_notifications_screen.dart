import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/core/services/push_notifications/firebase_cloud_messaging.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/add_notifications/logic/get_nots/get_notification_cubit.dart';
import 'package:velora/feature/customer/s.dart';

import '../../../../core/common/widgets/admin_app_bar.dart';
import '../logic/add_nots/add_notification_cubit.dart';
import 'components/add_notification_body.dart';

class AddNotifications extends StatelessWidget {
  const AddNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AddNotificationCubit>(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<GetNotificationCubit>()..getAllNotification(),
        ),
      ],
      child: Scaffold(
        appBar: AdminAppBar(
            isMain: true,
            title: 'Notifications',
            backgroundColor: context.color.mainColor!.withOpacity(1)),
        body: AddNotificationBody(),
      ),
    );
  }
}
