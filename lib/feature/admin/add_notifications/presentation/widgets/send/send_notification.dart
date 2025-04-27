import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/feature/admin/add_notifications/data/model/add_notification_model.dart';
import 'package:velora/feature/admin/add_notifications/logic/send_notification/send_notification_cubit.dart';
import 'package:velora/feature/admin/add_notifications/presentation/components/add_notification_body.dart';

import '../../../../../../core/common/widgets/show_toast.dart';
import '../../../../../../core/di/dependency_injection.dart';

class SendNotificationWidget extends StatelessWidget {
  const SendNotificationWidget(
      {super.key, required this.addNotificationModel, required this.index});
  final AddNotificationModel addNotificationModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SendNotificationCubit>(),
      child: BlocConsumer<SendNotificationCubit, SendNotificationState>(
        listener: (context, state) {
          // TODO: implement listener
          state.whenOrNull(
            success: () {
              ShowToast.showSuccessToast(
                'Notification Sent Successfully',
              );
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: (indexId) {
              if (index == indexId) {
                return SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: SpinKitFadingCube(
                      color: Colors.green,
                      size: 20,
                    ));
              }
              return Icon(
                Icons.send,
                color: Colors.green,
              );
            },
            orElse: () {
              return InkWell(
                onTap: () {
                  context.read<SendNotificationCubit>()
                    ..sendNotification(
                        addNotificationModel: addNotificationModel,
                        loadingAtIndex: index);
                },
                child: Icon(
                  Icons.send,
                  color: Colors.green,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
