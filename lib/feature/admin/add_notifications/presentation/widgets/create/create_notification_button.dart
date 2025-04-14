import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/context/context_extension.dart';

import '../../../../../../core/common/widgets/custom_button.dart';

class CreateNotificationButton extends StatelessWidget {
  const CreateNotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        validateCreateCategory();
      },
      backgroundColor: context.color.textColor,
      lastRadius: 20,
      threeRadius: 20,
      textColor: context.color.bluePinkDark,
      text: 'Add a Notification',
      width: MediaQuery.of(context).size.width,
      height: 50.h,
    );
    ();
  }
}

validateCreateCategory() {}
