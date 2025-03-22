import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/add_products/presentation/components/create/create_product.dart';
import 'package:velora/feature/admin/add_products/presentation/components/product_admin_item.dart';

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
                onRefresh: () async {},
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: verticalSpace(20),
                    ),
                    SliverToBoxAdapter(
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
                          return ProductAdminItem(
                            categoryName: "real madrid",
                            imageUrl:
                                "https://www.footballshirtculture.com/images/stories/real-madrid-2020-2021-third-kit/real_madrid_2020_2021_third_kit_e.jpg",
                            price: "120",
                            title: "real madrid kit",
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
