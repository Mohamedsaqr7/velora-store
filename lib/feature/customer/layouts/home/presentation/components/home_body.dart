import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/custom_button.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/customer/layouts/home/logic/categories/fetch_categories_cubit.dart';
import 'package:velora/feature/customer/layouts/home/logic/products/fetch_products_cubit.dart';
import 'package:velora/feature/customer/layouts/home/presentation/widgets/categories/categories_shimmer.dart';
import 'package:velora/feature/customer/layouts/home/presentation/widgets/products/products_list.dart';
import 'package:velora/feature/customer/layouts/home/presentation/widgets/products/products_list_shimmer.dart';

import '../widgets/banners/banners.dart';
import '../widgets/categories/categories_list.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<FetchCategoriesCubit>()..getCategories();
        context.read<FetchProductsCubit>()..getAllProducts();
      },
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: BannersSliders(),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(20),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<FetchCategoriesCubit, FetchCategoriesState>(
              builder: (context, state) {
                return state.when(
                  loading: () => CategoriesShimmer(),
                  success: (category) {
                    return CategoriesList(
                      categoryList: category,
                    );
                  },
                  error: (e) {
                    return const Center(
                      child: Text('Error'),
                    );
                  },
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<FetchProductsCubit, FetchProductsState>(
              builder: (context, state) {
                return state.when(
                  loading: () => ProductsListShimmer(),
                  success: (productList) {
                    return CustomerProductsList(
                      productsList: productList,
                    );
                  },
                  error: (e) {
                    return const Center(
                      child: Text('Error'),
                    );
                  },
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(20),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<FetchProductsCubit, FetchProductsState>(
              builder: (context, state) {
                if (context
                    .read<FetchProductsCubit>()
                    .isProductsSmallerThan10) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                    child: CustomButton(
                        onPressed: () {
                          context.pushName(AppRoutes.productsViewAll);
                        },
                        text: context.translate(LangKeys.viewAll),
                        lastRadius: 10,
                        threeRadius: 10,
                        textColor: Colors.black,
                        width: double.infinity,
                        backgroundColor: context.color.bluePinkLight,
                        height: 50.h),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: verticalSpace(40),
          ),
        ],
      ),
    );
  }
}
