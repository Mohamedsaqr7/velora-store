import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/feature/admin/add_notifications/logic/add_nots/add_notification_cubit.dart';
import 'package:velora/feature/admin/add_notifications/logic/get_nots/get_notification_cubit.dart';

import '../../../../../../core/common/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family.dart';
import '../../../../../../core/style/fonts/font_weight.dart';
import 'create_notification_bottom_sheet.dart';

class CreateNotification extends StatelessWidget {
  const CreateNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextApp(
          text: "Notifications",
          theme: context.textStyle.copyWith(
              fontSize: 18.sp,
              fontFamily: FontFamily.geLocalozedFontFamily(),
              fontWeight: FontWeightHelper.regular),
        ),
        CustomButton(
          onPressed: () {
            CustomBottomSheet.showModalBottomSheetContainer(
              context: context,
              widget: CreateNotificationBottomSheet(),
              whenComplete: () =>
                  context.read<GetNotificationCubit>()..getAllNotification(),
            );
          },
          text: 'add',
          width: 90.w,
          backgroundColor: context.color.bluePinkLight,
          height: 35.h,
          lastRadius: 10.r,
          threeRadius: 10.r,
        ),
        //addcategoryitem
      ],
    );
  }
}
