import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/loading_shimmer.dart';
import 'package:velora/core/style/theme/spacing.dart';

import '../../../../../core/common/widgets/logout_button.dart';

class UserProfileShimmer extends StatelessWidget {
  const UserProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoadingShimmer(height: 80.h, width: 80.w, borderRadius: 45.r),
        SizedBox(height: 7.h),
        LoadingShimmer(height: 10.h, width: 100.w),
        SizedBox(height: 7.h),
        LoadingShimmer(height: 10.h, width: 150.w),
        SizedBox(height: 30.h),
        LogoutButton(),
        Container(
          width: double.infinity,
          height: 500.h,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LoadingShimmer(height: 30.h, width: 150.w),
                    LoadingShimmer(
                      height: 30.h,
                      width: 80.w,
                      borderRadius: 45.r,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => verticalSpace(30),
              itemCount: 6),
        )
      ],
    );
  }
}
