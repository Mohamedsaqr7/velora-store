import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/feature/customer/products_view_all/logic/view_all_products_state.dart';

import '../../../home/presentation/widgets/products/customer_product_item.dart';
import '../../../home/presentation/widgets/products/products_list.dart';
import '../../../home/presentation/widgets/products/products_list_shimmer.dart';
import '../../logic/view_all_products_cubit.dart';

class ViewAllProductsBody extends StatefulWidget {
  const ViewAllProductsBody({super.key});

  @override
  State<ViewAllProductsBody> createState() => _ViewAllProductsBodyState();
}

class _ViewAllProductsBodyState extends State<ViewAllProductsBody> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      context.read<ProductsViewAllCubit>().handlerPagination(
            scrollController: _scrollController,
            loadMorePosition: MediaQuery.of(context).size.height * 0.15,
          );
    });

    context.read<ProductsViewAllCubit>().getProductsViewAll(); // مهم جدًا!
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: BlocBuilder<ProductsViewAllCubit, ProductsViewAllState>(
          builder: (context, state) {
        if (state is ProductsViewAllLoading && state.productsList.isEmpty) {
          return ProductsListShimmer();
        } else if (state is ProductsViewAllError) {
          return Center(
            child: Text(state.errorHandler.toString()),
          );
        } else
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: state.productsList.length,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8, //columns
                    mainAxisSpacing: 15, //rows
                    childAspectRatio: 9 / 15,
                  ),
                  itemBuilder: (context, index) {
                    return CustomerProductItem(
                      productId: int.parse(state.productsList[index].id ?? '0'),
                      categoryName: state.productsList[index].category?.name ??
                          'football',
                      price: state.productsList[index].price ?? 200,
                      title: state.productsList[index].title ?? 'clothes',
                      imageUrl: state.productsList[index].images?[0] ??
                          ' https://images.unsplash.com/photo-1618354691414-9e6b8b1e82b6?w=800',
                    );
                  },
                ),
              ),
              if (state is ProductsViewAllLoading &&
                  state.productsList.isNotEmpty)
                CircularProgressIndicator(
                  color: context.color.textColor,
                ),
            ],
          );
      }),
    );
  }
}
