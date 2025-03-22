import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/style/colors/colors_dark.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';

class CustomCreateDropDown extends StatelessWidget {
  const CustomCreateDropDown({
    required this.items,
    required this.hintText,
    required this.onChanged,
    required this.value,
    super.key,
  });
  final String hintText;
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsDark.blueLight,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconSize: 30.sp,
          borderRadius: BorderRadius.circular(12),
          dropdownColor: ColorsDark.blueDark,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp,
            fontWeight: FontWeightHelper.medium,
            fontFamily: FontFamily.geLocalozedFontFamily(),
          ),
          elevation: 16,
          icon: const Icon(
            Icons.expand_more,
            color: Colors.white,
          ),
          onChanged: onChanged,
          value: items.isNotEmpty ? value : null,
          isExpanded: true,
          hint: TextApp(
            text: hintText,
            theme: context.textStyle.copyWith(
              fontSize: 14.sp,
              color: Colors.white,
              fontFamily: FontFamily.geLocalozedFontFamily(),
            ),
          ),
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              onTap: () {},
              value: value,
              child: TextApp(
                text: value,
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
