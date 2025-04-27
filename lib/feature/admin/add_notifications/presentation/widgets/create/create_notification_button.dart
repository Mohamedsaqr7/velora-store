import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/feature/admin/add_notifications/logic/add_nots/add_notification_cubit.dart';

import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/show_toast.dart';

class CreateNotificationButton extends StatelessWidget {
  const CreateNotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNotificationCubit, AddNotificationState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ShowToast.showSuccessToast(
              'Notification created successfully',
            );
            context.pop();
          },
          error: (message) {
            ShowToast.showFailureToast(
              message,
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: SpinKitThreeInOut(
                  color: context.color.mainColor,
                  size: 20,
                ),
              ),
            );
          },
          orElse: () {
            return CustomButton(
              onPressed: () {
                validateCreateCategory(context);
              },
              backgroundColor: context.color.textColor,
              lastRadius: 20,
              threeRadius: 20,
              textColor: context.color.bluePinkDark,
              text: 'Add a Notification',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            );
          },
        );
      },
    );
  }
}

validateCreateCategory(BuildContext context) {
  var cubit = AddNotificationCubit.get(context);
  if (cubit.formkey.currentState!.validate()) {
    cubit.createNotification();
  }
}
