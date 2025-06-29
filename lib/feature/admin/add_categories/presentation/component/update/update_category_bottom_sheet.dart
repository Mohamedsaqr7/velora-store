import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/custom_button.dart';
import 'package:velora/core/common/widgets/custom_text_field.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/feature/admin/add_categories/logic/update_category/update_category_cubit.dart';
import 'package:velora/feature/admin/add_categories/presentation/component/update/update_upload_image.dart';

import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family.dart';
import '../../../../../../core/style/fonts/font_weight.dart';
import '../../../../../../core/style/theme/spacing.dart';
import '../../../data/models/update_category_request_body.dart';
import '../create/category_upload_image.dart';
import 'update_category_button.dart';

class UpdateCategoryBottomSheet extends StatefulWidget {
  UpdateCategoryBottomSheet(
      {super.key,
      required this.imageUrl,
      required this.categoryId,
      required this.ctageoryName});

  final String imageUrl;
  final String categoryId;
  final String ctageoryName;

  @override
  State<UpdateCategoryBottomSheet> createState() =>
      _UpdateCategoryBottomSheetState();
}

class _UpdateCategoryBottomSheetState extends State<UpdateCategoryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCategoryCubit, UpdateCategoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = UpdateCategoryCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20.r),
          child: Form(
            key: cubit.formKey,
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
                UpdateUploadImage(imageUrl: widget.imageUrl),
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
                  controller: cubit.updateCategoryNameController,
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
                UpdateCategoryButton(
                  update: UpdateCategoryRequestBody(
                      name: widget.ctageoryName,
                      id: widget.categoryId,
                      image: widget.imageUrl),
                ),
                verticalSpace(10)
              ],
            ),
          ),
        );
      },
    );
  }
}
