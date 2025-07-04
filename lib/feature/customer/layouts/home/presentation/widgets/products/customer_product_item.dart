import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/custom_favourite_button.dart';
import 'package:velora/core/common/widgets/custom_cart_button.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/extensions/strring_extension.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/feature/customer/layouts/favourite/cubit/favourites_cubit.dart';

import '../../../../../../../core/common/widgets/custom_container_linera_customer.dart';
import '../../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../../core/style/fonts/font_weight.dart';
import '../../../../cart/cubit/cart_cubit.dart';

class CustomerProductItem extends StatelessWidget {
  const CustomerProductItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.categoryName,
      required this.price,
      required this.productId});

  final String imageUrl;
  final String title;
  final String categoryName;
  final double price;
  final int productId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushName(AppRoutes.productDetails, arguments: productId);
      },
      child: CustomContainerLinearCustomer(
        height: 250.h,
        width: 165.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Share Button
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return CustomCartButton(
                      size: 30,
                      isInCart: context
                          .read<CartCubit>()
                          .isInCart(productId.toString()),
                      onTap: () async {
                        await context.read<CartCubit>().addOrUpdateCart(
                              productId: productId.toString(),
                              title: title,
                              image: imageUrl,
                              price: price.toString(),
                              categoryName: categoryName,
                            );
                      },
                    );
                  },
                ),
                //Favorite Button
                BlocBuilder<FavouritesCubit, FavouritesState>(
                  builder: (context, state) {
                    return CustomFavoriteButton(
                      size: 25,
                      isFavorites: context
                          .read<FavouritesCubit>()
                          .isFavorites(productId.toString()),
                      onTap: () async {
                        await context.read<FavouritesCubit>().manageFavourites(
                              productId: productId.toString(),
                              title: title,
                              image: imageUrl,
                              price: price.toString(),
                              categoryName: categoryName,
                            );
                      },
                    );
                  },
                ),
              ],
            ),
            // Show Image
            Flexible(
              child: Center(
                child: CachedNetworkImage(
                  height: 200.h,
                  width: 120.w,
                  imageUrl: imageUrl.imageProductFormate(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 70,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            // title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: title,
                theme: context.textStyle.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5.h),
            // Category Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: categoryName,
                theme: context.textStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 5.h),
            // Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextApp(
                text: '\$ $price',
                theme: context.textStyle.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeightHelper.medium,
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
