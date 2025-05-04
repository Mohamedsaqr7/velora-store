import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/core/style/theme/spacing.dart';

import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/style/fonts/font_weight.dart';
import '../../../home/presentation/widgets/products/customer_product_item.dart';
import '../../cubit/cart_cubit.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (context.read<CartCubit>().cartList.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: context.color.textColor,
                  size: 150,
                ),
                TextApp(
                  text: 'Choose Your Cart Products',
                  theme: context.textStyle.copyWith(
                    fontWeight: FontWeightHelper.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [
              Container(
                height: 600.h,
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: context.read<CartCubit>().cartList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //Number of cloums
                    crossAxisSpacing: 8, // Spacing between colums
                    mainAxisSpacing: 15, //Spacing between rows
                    childAspectRatio: 165 / 250,
                  ),
                  itemBuilder: (context, index) {
                    final list = context.read<CartCubit>().cartList;
                    return CustomerProductItem(
                      price: double.parse(list[index].price),
                      categoryName: list[index].categoryName,
                      title: list[index].title,
                      imageUrl: list[index].image,
                      productId: int.parse(list[index].id),
                    );
                  },
                ),
              ),
              verticalSpace(5),
              InkWell(
                onTap: () {
                  context.pushName(AppRoutes.checkOut,
                      arguments: context.read<CartCubit>().totalPrice);
                },
                child: Container(
                  height: 70.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                    color: context.color.bluePinkDark,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextApp(
                          text: 'Total Price',
                          theme: context.textStyle.copyWith(
                            fontWeight: FontWeightHelper.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        TextApp(
                          text:
                              '${context.read<CartCubit>().totalPrice.toString()} \$',
                          theme: context.textStyle.copyWith(
                            fontWeight: FontWeightHelper.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ]),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
