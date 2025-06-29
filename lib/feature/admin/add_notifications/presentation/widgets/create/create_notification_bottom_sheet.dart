import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/feature/admin/add_notifications/logic/add_nots/add_notification_cubit.dart';
import 'package:velora/feature/admin/add_notifications/presentation/widgets/create/create_notification_button.dart';

import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/style/fonts/font_family.dart';
import '../../../../../../core/style/fonts/font_weight.dart';
import '../../../../../../core/style/theme/spacing.dart';

class CreateNotificationBottomSheet extends StatelessWidget {
  const CreateNotificationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddNotificationCubit>(),
      child: BlocBuilder<AddNotificationCubit, AddNotificationState>(
        builder: (context, state) {
          var cubit = AddNotificationCubit.get(context);

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20.r),
            child: Form(
              key: cubit.formkey,
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
                    controller: cubit.titleController,
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
                    controller: cubit.bodyController,
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
                    controller: cubit.productIDController,
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'product ID',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter the product ID';
                      }
                      return null;
                    },
                  ),
                  verticalSpace(20),
                  CreateNotificationButton(),
                  verticalSpace(10)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
