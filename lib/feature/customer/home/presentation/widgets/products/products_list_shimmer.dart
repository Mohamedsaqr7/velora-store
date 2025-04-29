import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/loading_shimmer.dart';

class ProductsListShimmer extends StatelessWidget {
  const ProductsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 6,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8, //columns
        mainAxisSpacing: 15, //rows
        childAspectRatio: 9 / 15,
      ),
      itemBuilder: (context, index) {
        return LoadingShimmer(
          height: 260.h,
          width: 160.w,
        );
      },
    );
    ;
  }
}
