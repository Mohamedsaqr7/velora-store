import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/feature/customer/home/presentation/widgets/products/customer_product_item.dart';

import '../../../../../../core/common/widgets/loading_shimmer.dart';
import '../../../../../admin/add_products/data/model/get_all_products_response.dart';

class CustomerProductsList extends StatelessWidget {
  const CustomerProductsList({super.key, required this.productsList});
  final List<ProductGetAllModel> productsList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GridView.builder(
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
          return CustomerProductItem(
            productId: int.parse(productsList[index].id ?? '0'),
            categoryName: productsList[index].category?.name ?? 'football',
            price: productsList[index].price ?? 200,
            title: productsList[index].title ?? 'clothes',
            imageUrl: productsList[index].images?[0] ??
                ' https://images.unsplash.com/photo-1618354691414-9e6b8b1e82b6?w=800',
          );
        },
      ),
    );
    
  }
}
