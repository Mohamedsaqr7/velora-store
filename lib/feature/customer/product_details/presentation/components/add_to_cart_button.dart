import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/show_toast.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/feature/customer/cart/cubit/cart_cubit.dart';

import '../../../../../core/common/widgets/animate_do.dart';
import '../../../../../core/common/widgets/custom_linear_button.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/style/fonts/font_weight.dart';
import '../../data/model/product_details_response.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton(
      {required this.price, super.key, required this.productModel});
  final ProductDetailsModel productModel;
  final double price;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 500,
      child: Container(
        height: 90.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: context.color.containerShadow1,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextApp(
                text: '\$ $price',
                theme: context.textStyle.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeightHelper.medium,
                  color: context.color.bluePinkLight,
                ),
              ),
              BlocConsumer<CartCubit, CartState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return CustomLinearButton(
                    onPressed: () async {
                      await context.read<CartCubit>().addOrUpdateCart(
                            productId: productModel.id ?? '',
                            title: productModel.title ?? '',
                            image: productModel.images.first,
                            price: productModel.price.toString(),
                            categoryName: productModel.category!.name,
                          );
                      ShowToast.showSuccessToast('Added to cart succesfully');
                    },
                    height: 40.h,
                    width: 140.w,
                    child: TextApp(
                      text: 'Add to cart',
                      theme: context.textStyle.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeightHelper.bold,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
