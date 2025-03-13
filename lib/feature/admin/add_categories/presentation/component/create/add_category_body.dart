import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:velora/core/common/widgets/custom_button.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/add_categories/presentation/component/create/add_category_item.dart';
import 'package:velora/feature/admin/add_categories/presentation/component/create/create_category_bottom_sheet.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextApp(
              text: "get all categories",
              theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                  fontWeight: FontWeightHelper.regular),
            ),
            CustomButton(
              onPressed: () {
                CustomBottomSheet.showModalBottomSheetContainer(
                    context: context, widget: CreateCategoryBottomSheet());
              },
              text: 'add',
              width: 90.w,
              backgroundColor: context.color.bluePinkLight,
              height: 35.h,
              lastRadius: 10.r,
              threeRadius: 10.r,
            ),
            //addcategoryitem
          ],
        ),
        verticalSpace(10),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: verticalSpace(20.h),
              ),
              SliverToBoxAdapter(
                child: ListView.separated(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => verticalSpace(10),
                  itemBuilder: (context, index) {
                    return AddCategoryItem(
                      categoryId: 'i',
                      name: 'macbook',
                      image:
                          "https://cdn2.vox-cdn.com/uploads/chorus_asset/file/7390261/vpavic_161031_1256_0264.0.jpg",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
//
