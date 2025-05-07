import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/common/widgets/custom_cart_button.dart';
import 'package:velora/core/common/widgets/custom_favourite_button.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/customer/layouts/cart/cubit/cart_cubit.dart';
import 'package:velora/feature/customer/layouts/favourite/cubit/favourites_cubit.dart';
import 'package:readmore/readmore.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/feature/customer/screens/product_details/presentation/widgets/product_details_image_slider.dart';
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
            CustomFadeInRight(
              duration: 400,
              child: Row(
                children: [
                 BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return CustomCartButton(
                        size: 30,
                       isInCart : context
                            .read<CartCubit>()
                            .isInCart(productModel.id ?? ''),
                        onTap: () async {
                          await context
                              .read<CartCubit>()
                              .addOrUpdateCart(
                                productId: productModel.id ?? '',
                                title: productModel.title ?? '',
                                image: productModel.images.first,
                                price: productModel.price.toString(),
                                categoryName: productModel.category!.name,
                              );
                        },
                      );
                    },
                  ),
                  Spacer(),
                  BlocBuilder<FavouritesCubit, FavouritesState>(
                    builder: (context, state) {
                      return CustomFavoriteButton(
                        size: 30,
                        isFavorites: context
                            .read<FavouritesCubit>()
                            .isFavorites(productModel.id ?? ''),
                        onTap: () async {
                          await context
                              .read<FavouritesCubit>()
                              .manageFavourites(
                                productId: productModel.id ?? '',
                                title: productModel.title ?? '',
                                image: productModel.images.first,
                                price: productModel.price.toString(),
                                categoryName: productModel.category!.name,
                              );
                        },
                      );
                    },
                  ),
                  verticalSpace(10),
                ],
              ),
            ),
            ProductDetailsImageSlider(
              imageList: productModel.images,
            ),
            verticalSpace(30),
            CustomFadeInRight(
              duration: 600,
              child: TextApp(
                text: productModel.title ?? ".title ",
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
            verticalSpace(10) //description
            ,
            CustomFadeInRight(
              duration: 800,
              child: ReadMoreText(
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
