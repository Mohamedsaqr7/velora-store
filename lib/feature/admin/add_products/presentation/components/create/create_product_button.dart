
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/extensions/context_extension.dart';

import '../../../../../../core/common/widgets/custom_button.dart';

class CreateProductButton extends StatelessWidget {
  const CreateProductButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        // _validUpdateProduct(context);
      },
      backgroundColor: Colors.white,
      lastRadius: 20,
      threeRadius: 20,
      textColor: context.color.bluePinkDark,
      text: 'Create Product',
      width: MediaQuery.of(context).size.width,
      height: 50.h,
    );
  }
}
