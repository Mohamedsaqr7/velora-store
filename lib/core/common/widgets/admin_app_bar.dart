import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';

class AdminAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AdminAppBar(
      {super.key,
      required this.isMain,
      required this.title,
      required this.backgroundColor});
  final bool isMain;
  final String title;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      title: TextApp(
        text: title,
        theme: context.textStyle.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeightHelper.bold,
          color: context.color.textColor,
          fontFamily: FontFamily.geLocalozedFontFamily(),
        ),
      ),
      leading: isMain
          ? IconButton(
              onPressed: () {
                ZoomDrawer.of(context)!.toggle();
              },
              icon: Icon(
                Icons.menu,
                color: context.color.textColor,
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50.h);
}
