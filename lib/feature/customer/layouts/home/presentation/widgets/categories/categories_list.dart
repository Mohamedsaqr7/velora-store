import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/style/theme/spacing.dart';

import '../../../../../../admin/add_categories/data/models/get_all_categories_response.dart';
import 'category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key, required this.categoryList});
  final List<Category> categoryList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
      child: SizedBox(
        height: 118.h,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryItem(id: int.parse(categoryList[index].id),
                  image: categoryList[index].image,
                  title: categoryList[index].name);
            },
            separatorBuilder: (context, index) => horizontalSpace(10),
            itemCount: categoryList.length),
      ),
    );
  }
}
