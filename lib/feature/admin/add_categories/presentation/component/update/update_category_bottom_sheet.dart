import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/custom_button.dart';
import 'package:velora/core/common/widgets/custom_text_field.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/feature/admin/add_categories/presentation/component/update/update_upload_image.dart';

import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family.dart';
import '../../../../../../core/style/fonts/font_weight.dart';
import '../../../../../../core/style/theme/spacing.dart';
import '../create/category_upload_image.dart';

class UpdateCategoryBottomSheet extends StatelessWidget {
  UpdateCategoryBottomSheet({super.key});

  final formkey = GlobalKey<FormState>();
  TextEditingController nameCategoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.r),
      child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextApp(
              text: "update category",
              theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                  fontWeight: FontWeightHelper.regular),
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextApp(
                  text: 'Update a photo',
                  theme: context.textStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeightHelper.medium,
                    fontFamily: FontFamily.geLocalozedFontFamily(),
                  ),
                ),
                //Remove Image
                CustomButton(
                  onPressed: () {},
                  backgroundColor: Colors.red,
                  lastRadius: 10,
                  threeRadius: 10,
                  text: 'Remove',
                  width: 120.w,
                  height: 35.h,
                ),
              ],
            ),
            verticalSpace(10),
            UpdateUploadImage(),
            verticalSpace(10),
            TextApp(
              text: 'Update the Category Name',
              theme: context.textStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamily.geLocalozedFontFamily(),
              ),
            ),
            verticalSpace(10),
            CustomTextField(
              controller: nameCategoryController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'Category Name',
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 2) {
                  return 'Please Selected Your Category Name';
                }
                return null;
              },
            ),
            verticalSpace(10),
            CustomButton(
              onPressed: () {},
              backgroundColor: context.color.textColor,
              lastRadius: 20,
              threeRadius: 20,
              textColor: context.color.bluePinkDark,
              text: 'Create a new category',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            ),
            verticalSpace(10)
          ],
        ),
      ),
    );
  }
}
