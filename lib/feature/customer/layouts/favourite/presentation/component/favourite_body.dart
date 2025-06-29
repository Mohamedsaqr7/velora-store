import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/feature/customer/layouts/home/presentation/widgets/products/customer_product_item.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../cubit/favourites_cubit.dart';

class FavouriteBody extends StatelessWidget {
  const FavouriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
      child: BlocBuilder<FavouritesCubit, FavouritesState>(
        builder: (context, state) {
          if (context.read<FavouritesCubit>().favoritesLis.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_outline,
                  color: context.color.textColor,
                  size: 150,
                ),
                TextApp(
                  text: 'Choose Your Favorite Products',
                  theme: context.textStyle.copyWith(
                    fontWeight: FontWeightHelper.bold,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            );
          }
          return GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: context.read<FavouritesCubit>().favoritesLis.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Number of cloums
              crossAxisSpacing: 8, // Spacing between colums
              mainAxisSpacing: 15, //Spacing between rows
              childAspectRatio: 165 / 250,
            ),
            itemBuilder: (context, index) {
              final list = context.read<FavouritesCubit>().favoritesLis;
              return CustomerProductItem(
                price: double.parse(list[index].price),
                categoryName: list[index].categoryName,
                title: list[index].title,
                imageUrl: list[index].image,
                productId: int.parse(list[index].id),
              );
            },
          );
        },
      ),
    );
  }
}
