import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/custom_container_linear_admin.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/core/style/theme/spacing.dart';

import '../../../../../core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'update/update_product_bottom_sheet.dart';

class ProductAdminItem extends StatelessWidget {
  const ProductAdminItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.categoryName,
      required this.price});
  final String imageUrl;
  final String title;
  final String categoryName;
  final String price;
  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 260.h,
      width: 160.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 25,
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  CustomBottomSheet.showModalBottomSheetContainer(
                    context:context,
                  widget: UpdateProductBottomSheet());
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.green,
                  size: 25,
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Flexible(
            child: Center(
              child: CachedNetworkImage(
                height: 200.h,
                width: 120.w,
                imageUrl: imageUrl,
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 70.sp,
                ),
              ),
            ),
          ),
          verticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextApp(
              text: title,
              theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                  fontWeight: FontWeightHelper.bold),
              maxLines: 1,
            ),
          ),
          verticalSpace(5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextApp(
              text: categoryName,
              theme: context.textStyle.copyWith(
                  fontSize: 12.sp,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                  fontWeight: FontWeightHelper.medium),
              maxLines: 1,
            ),
          ),
          verticalSpace(5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextApp(
              text: '\$ $price',
              theme: context.textStyle.copyWith(
                  fontSize: 12.sp,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                  fontWeight: FontWeightHelper.medium),
              maxLines: 1,
            ),
          ),
          verticalSpace(5)
        ],
      ),
    );
  }
}
