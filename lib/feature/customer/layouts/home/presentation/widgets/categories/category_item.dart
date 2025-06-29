import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/extensions/strring_extension.dart';
import 'package:velora/core/style/theme/spacing.dart';

import '../../../../../../../core/common/widgets/custom_container_linera_customer.dart';
import '../../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/style/fonts/font_weight.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.image, required this.title, required this.id});
  @override
  final String image;
  final String title;
  final int id;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushName(AppRoutes.category,
            arguments: (categoryName: title, categoryId: id));
      },
      child: Column(
        children: [
          //image
          CustomContainerLinearCustomer(
            height: 71.h,
            width: 71.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: image.imageProductFormate(),
                fit: BoxFit.fill,
                height: 71.h,
                width: 71.w,
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
          ),
          verticalSpace(5),
          SizedBox(
            height: 35.h,
            width: 75.w,
            child: TextApp(
              text: title,
              textAlign: TextAlign.center,
              theme: context.textStyle.copyWith(
                fontWeight: FontWeightHelper.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
