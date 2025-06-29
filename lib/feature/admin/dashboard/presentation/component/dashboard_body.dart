import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/dashboard/presentation/component/dashboard_container.dart';
import 'package:velora/feature/admin/dashboard/logic/categories_number_cubit/categories_cubit.dart';
import 'package:velora/feature/admin/dashboard/logic/products_number_cubit/product_cubit.dart';
import 'package:velora/feature/admin/dashboard/logic/users_number_cubit/users_cubit.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductCubit>()..fetchNumberOfProducts();
          context.read<CategoriesCubit>()..fetchNumberOfCategories();
          context.read<UsersCubit>()..fetchNumberOfUsers();
        },
        child: ListView(
          children: [
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      image: AppAssets.productsDrawer,
                      number: "",
                      title: 'products',
                      isLoading: true,
                    );
                  },
                  success: (numbers) {
                    return DashboardContainer(
                      image: AppAssets.productsDrawer,
                      number: numbers,
                      title: 'products',
                      isLoading: false,
                    );
                  },
                  failure: (error) {
                    return TextApp(
                        text: error,
                        theme: context.textStyle.copyWith(color: Colors.red));
                  },
                );
              },
            ),
            verticalSpace(20),
            BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      image: AppAssets.categoriesDrawer,
                      number: "",
                      title: 'Categories',
                      isLoading: true,
                    );
                  },
                  success: (numbers) {
                    return DashboardContainer(
                      image: AppAssets.categoriesDrawer,
                      number: numbers,
                      title: 'Categories',
                      isLoading: false,
                    );
                  },
                  failure: (error) {
                    return TextApp(
                        text: error,
                        theme: context.textStyle.copyWith(color: Colors.red));
                  },
                );
              },
            ),
            verticalSpace(20),
            BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) {
                return state.when(
                  loading: () {
                    return const DashboardContainer(
                      image: AppAssets.usersDrawer,
                      number: "",
                      title: 'Users',
                      isLoading: true,
                    );
                  },
                  success: (numbers) {
                    return DashboardContainer(
                      image: AppAssets.usersDrawer,
                      number: numbers,
                      title: 'Users',
                      isLoading: false,
                    );
                  },
                  failure: (error) {
                    return TextApp(
                        text: error,
                        theme: context.textStyle.copyWith(color: Colors.red));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/* 
// كلاس كبير 
جواه ليست اوف كلاس الاسم و الصوره والحاجات دي 
وكلاس الحاجات دي جواه كلاس الكاتيجوري
*/