import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/customer/product_details/presentation/widgets/product_details_image_slider.dart';
import 'package:readmore/readmore.dart';
import '../../../../../core/common/widgets/custom_favourite_button.dart';
import '../../../../../core/common/widgets/custom_share_button.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/style/fonts/font_weight.dart';
import '../../data/model/product_details_response.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productModel});
  final ProductDetailsModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomShareButton(size: 30, onTap: () {}),
                Spacer(),
                CustomFavoriteButton(
                    size: 30, isFavorites: false, onTap: () {}),
                verticalSpace(10),
              ],
            ),
            ProductDetailsImageSlider(
              imageList: productModel.images,
            ),
            verticalSpace(30),
            TextApp(
              text: productModel.title ?? ".title ",
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            verticalSpace(10) //description
            ,
            ReadMoreText(
              productModel.description ?? '',
              trimMode: TrimMode.Length,
              trimLines: 5,
              colorClickableText: context.color.bluePinkLight,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: context.textStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.bold,
                color: context.color.bluePinkLight,
              ),
              style: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.regular,
                color: context.color.textColor,
              ),
            ),
            // TextApp(
            //   maxLines: 5,
            //   textOverflow: TextOverflow.ellipsis,
            //   text: productModel.description ?? "productModel.description ?? ''",
            //   theme: context.textStyle.copyWith(
            //     fontSize: 16.sp,
            //     fontWeight: FontWeightHelper.regular,
            //     color: context.color.textColor,
            //     height: 1.5,
            //   ),
            // ),
            verticalSpace(30)
          ],
        ),
      ),
    );
  }
}
