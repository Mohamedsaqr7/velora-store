import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/style/fonts/font_family.dart';

import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/style/fonts/font_weight.dart';

class TableCellTitleWidget extends StatelessWidget {
  const TableCellTitleWidget({
    required this.icon,
    required this.title,
    super.key,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 5.w,
          ),
          TextApp(
            text: title,
            theme: context.textStyle.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeightHelper.medium,
              fontFamily: FontFamily.geLocalozedFontFamily(),
            ),
          )
        ],
      ),
    );
  }
}