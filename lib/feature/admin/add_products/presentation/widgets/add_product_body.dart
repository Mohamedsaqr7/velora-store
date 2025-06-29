import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/loading_shimmer.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/add_products/logic/get_all_products/get_all_products_cubit.dart';
import 'package:velora/feature/admin/add_products/presentation/components/create/create_product.dart';
import 'package:velora/feature/admin/add_products/presentation/widgets/product_admin_item.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
      child: Column(
        children: [
          const CreateProduct(),
          Expanded(
            child: RefreshIndicator(
                onRefresh: () async {
                  context.read<GetAllProductsCubit>()..getAllProducts();
                },
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: verticalSpace(20),
                    ),
                    SliverToBoxAdapter(
                      child:
                          BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () {
                              return GridView.builder(
                                shrinkWrap: true,
                                itemCount: 10,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8, //columns
                                  mainAxisSpacing: 15, //rows
                                  childAspectRatio: 9 / 15,
                                ),
                                itemBuilder: (context, index) {
                                  return LoadingShimmer(
                                    height: 260.h,
                                    width: 160.w,
                                  );
                                },
                              );
                            },
                            orElse: () {
                              return Text('data');
                            },
                            success: (productList) {
                              return GridView.builder(
                                shrinkWrap: true,
                                itemCount: productList.length,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8, //columns
                                  mainAxisSpacing: 15, //rows
                                  childAspectRatio: 9 / 15,
                                ),
                                itemBuilder: (context, index) {
                                  return ProductAdminItem(
                                    categoryName:
                                        productList[index].category!.name ??
                                            'real madrid',
                                    imageUrl:
                                        productList[index].images?.first ?? '',
                                    price: productList[index].price.toString(),
                                    title: productList[index].title ??
                                        "real madrid kit",
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
