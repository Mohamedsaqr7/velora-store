import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/screens/under_build_screen.dart';
import 'package:velora/core/common/widgets/loading_shimmer.dart';
import 'package:velora/feature/customer/screens/categories/logic/get_all_category_cubit.dart';

import '../../../../layouts/home/presentation/widgets/products/customer_product_item.dart';

class CustomerCategoryBody extends StatelessWidget {
  const CustomerCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: BlocBuilder<GetAllCategoryCubit, GetAllCategoryState>(
        builder: (context, state) {
          return state.when(
            loading: () {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: 10,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8, //columns
                  mainAxisSpacing: 15, //rows
                  childAspectRatio: 9 / 15,
                ),
                itemBuilder: (context, index) {
                  return LoadingShimmer(
                    height: 250.h,
                    width: 150.w,
                  );
                },
              );
            },
            success: (productsList) {
              return GridView.builder(
                shrinkWrap: true,
                itemCount: productsList.length,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8, //columns
                  mainAxisSpacing: 15, //rows
                  childAspectRatio: 9 / 15,
                ),
                itemBuilder: (context, index) {
                  return CustomerProductItem(
                    productId: int.parse(productsList[index].id ?? '0'),
                    categoryName:
                        productsList[index].category?.name ?? 'football',
                    price: productsList[index].price ?? 200,
                    title: productsList[index].title ?? 'clothes',
                    imageUrl: productsList[index].images?[0] ??
                        ' https://images.unsplash.com/photo-1618354691414-9e6b8b1e82b6?w=800',
                  );
                },
              );
            },
            empty: PageUnderBuildScreen.new,
            error: (e) {
              return const Center(
                child: Text('Error'),
              );
            },
          );
        },
      ),
    );
  }
}
