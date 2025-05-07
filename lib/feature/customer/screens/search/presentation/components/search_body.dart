import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/core/common/screens/under_build_screen.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/customer/screens/search/logic/search_cubit.dart';

import '../../../../layouts/home/presentation/widgets/products/customer_product_item.dart';
import '../widgets/filter_buttons.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          FilterButtons(),
          verticalSpace(20),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              return state.when(
                loading: () {
                  return Center(
                    child: SpinKitFadingCube(
                      color: context.color.textColor,
                    ),
                  );
                },
                success: (productList) {
                  return Container(
                    height: 360,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: productList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, //Number of cloums
                        crossAxisSpacing: 8, // Spacing between colums
                        mainAxisSpacing: 15, //Spacing between rows
                        childAspectRatio: 165 / 250,
                      ),
                      itemBuilder: (context, index) {
                        return CustomerProductItem(
                          price: productList[index].price ?? 0,
                          categoryName: productList[index].category!.name ?? '',
                          title: productList[index].title ?? '',
                          imageUrl: productList[index].images!.first,
                          productId: int.parse(productList[index].id ?? '0'),
                        );
                      },
                    ),
                  );
                },
                initial: () => SizedBox.shrink(),
                empty: PageUnderBuildScreen.new,
                error: (e) {
                  return const Center(
                    child: Text('Error'),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
