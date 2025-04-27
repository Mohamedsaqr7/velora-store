import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velora/core/common/widgets/custom_container_linear_admin.dart';
import 'package:velora/core/common/widgets/loading_shimmer.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer(
      {super.key,
      required this.title,
      required this.number,
      required this.image,
      required this.isLoading});
  final String title;
  final String number;
  final String image;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 150.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextApp(
                  text: title,
                  theme: context.textStyle.copyWith(
                    fontSize: 24.sp,
                    fontWeight: FontWeightHelper.bold,
                    fontFamily: FontFamily.geLocalozedFontFamily(),
                  ),
                ),
                const Spacer(),
                if (isLoading)
                  LoadingShimmer(
                    height: 30.h,
                    width: 100.w,
                  )
                else
                  TextApp(
                    text: number,
                    theme: context.textStyle.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeightHelper.bold,
                      fontFamily: FontFamily.geLocalozedFontFamily(),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 100.h,
              child: Image.asset(image),
            )
          ],
        ),
      ),
    );
  }
}
