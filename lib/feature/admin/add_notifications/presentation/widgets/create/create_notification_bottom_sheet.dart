import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/context/context_extension.dart';

import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family.dart';
import '../../../../../../core/style/fonts/font_weight.dart';
import '../../../../../../core/style/theme/spacing.dart';
import 'create_notification_button.dart';

class CreateNotificationBottomSheet extends StatefulWidget {
  const CreateNotificationBottomSheet({super.key});

  @override
  State<CreateNotificationBottomSheet> createState() =>
      _CreateNotificationBottomSheetState();
}

final formkey = GlobalKey<FormState>();
TextEditingController titleController = TextEditingController();
TextEditingController bodyController = TextEditingController();
TextEditingController productIDController = TextEditingController();

class _CreateNotificationBottomSheetState
    extends State<CreateNotificationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.r),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: TextApp(
                text: "Add Notifications",
                theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontFamily: FontFamily.geLocalozedFontFamily(),
                    fontWeight: FontWeightHelper.bold),
              ),
            ),
            verticalSpace(20),
            TextApp(
              text: 'Enter the notification title',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamily.geLocalozedFontFamily(),
              ),
            ),
            verticalSpace(10),
            CustomTextField(
              controller: titleController,
              hintText: 'title',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'enter the title';
                }
                return null;
              },
            ),
            verticalSpace(10),
            TextApp(
              text: 'Enter the notification body',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamily.geLocalozedFontFamily(),
              ),
            ),
            verticalSpace(10),
            CustomTextField(
              controller: bodyController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'body',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'enter the body';
                }
                return null;
              },
            ),
            verticalSpace(10),
            TextApp(
              text: 'Enter the  product ID',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamily.geLocalozedFontFamily(),
              ),
            ),
            verticalSpace(10),
            CustomTextField(
              controller: productIDController,
              keyboardType: TextInputType.number,
              hintText: 'product ID',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'enter the product ID';
                }
                return null;
              },
            ),
            verticalSpace(20),
            CreateNotificationButton(),
            verticalSpace(10),
          ],
        ),
      ),
    );
    ;
  }
}
