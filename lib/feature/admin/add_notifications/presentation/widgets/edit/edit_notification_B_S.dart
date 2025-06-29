import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/fonts/font_family.dart';

import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/style/fonts/font_weight.dart';
import '../../../../../../core/style/theme/spacing.dart';
import '../../../data/model/add_notification_model.dart';

class EditNotificationBottomSheet extends StatefulWidget {
  EditNotificationBottomSheet({required this.editNotificationModel, super.key});
  AddNotificationModel editNotificationModel;

  @override
  State<EditNotificationBottomSheet> createState() =>
      _EditNotificationBottomSheetState();
}

class _EditNotificationBottomSheetState
    extends State<EditNotificationBottomSheet> {
  final formkey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();

  TextEditingController bodyController = TextEditingController();

  TextEditingController productIDController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    titleController.text = widget.editNotificationModel.title ?? '';
    bodyController.text = widget.editNotificationModel.body ?? '';
    productIDController.text =
        widget.editNotificationModel.productID.toString();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    productIDController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
                text: "Edit Notification",
                theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontFamily: FontFamily.geLocalozedFontFamily(),
                    fontWeight: FontWeightHelper.bold),
              ),
            ),
            verticalSpace(20),
            TextApp(
              text: 'Edit the notification title',
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
                  return 'Edit the title';
                }
                return null;
              },
            ),
            verticalSpace(10),
            TextApp(
              text: 'Edit the notification body',
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
                  return 'Ed the body';
                }
                return null;
              },
            ),
            verticalSpace(10),
            TextApp(
              text: 'Ed the  product ID',
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
                if (value == null || value.isEmpty) {
                  return 'Edit the product ID';
                }
                return null;
              },
            ),
            verticalSpace(20),
            // CreateNotificationButton(),
            CustomButton(
              onPressed: () {
                _validEditNotification(context);
              },
              backgroundColor: context.color.textColor,
              lastRadius: 20,
              threeRadius: 20,
              textColor: context.color.bluePinkDark,
              text: 'Edit a Notification',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            ),
            verticalSpace(10),
          ],
        ),
      ),
    );
  }

  void _validEditNotification(BuildContext context) {
    if (formkey.currentState!.validate()) {
      widget.editNotificationModel.title = titleController.text.isEmpty
          ? widget.editNotificationModel.title
          : titleController.text.trim();
      widget.editNotificationModel.body = bodyController.text.isEmpty
          ? widget.editNotificationModel.body
          : bodyController.text.trim();
      widget.editNotificationModel.productID = productIDController.text.isEmpty
          ? widget.editNotificationModel.productID
          : int.parse(productIDController.text.trim());
      widget.editNotificationModel.save();
      context.pop();
    }
  }
}
