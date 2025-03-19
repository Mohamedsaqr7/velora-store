import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/app/upload_image/cubit/upload_cubit.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/add_categories/logic/create_category/create_category_cubit.dart';
import 'package:velora/feature/admin/add_categories/presentation/component/create/category_upload_image.dart';
import 'package:velora/feature/admin/add_categories/presentation/component/create/create_category_button.dart';

import '../../../../../../core/app/upload_image/cubit/upload_state.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';

class CreateCategoryBottomSheet extends StatefulWidget {
  const CreateCategoryBottomSheet({super.key});

  @override
  State<CreateCategoryBottomSheet> createState() =>
      _CreateCategoryBottomSheetState();
}

class _CreateCategoryBottomSheetState extends State<CreateCategoryBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateCategoryCubit, CreateCategoryState>(
        builder: (context, state) {
      var cubit = CreateCategoryCubit.get(context);
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.r),
        child: Form(
          key: cubit.formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: "create categories",
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
                    text: 'Add a photo',
                    theme: context.textStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.medium,
                      fontFamily: FontFamily.geLocalozedFontFamily(),
                    ),
                  ),
                  //Remove Image
                  BlocBuilder<UploadImageCubit, UploadImageState>(
                    builder: (context, state) {
                      if (context
                          .read<UploadImageCubit>()
                          .uploadImageUrl
                          .isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return CustomButton(
                        onPressed: () {
                          context.read<UploadImageCubit>().deleteImage();
                        },
                        backgroundColor: Colors.red,
                        lastRadius: 10,
                        threeRadius: 10,
                        text: 'Remove',
                        width: 120.w,
                        height: 35.h,
                      );
                    },
                  ),
                ],
              ),
              verticalSpace(10),
              CategoryUploadImage(),
              verticalSpace(10),
              TextApp(
                text: 'Enter the Category Name',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                ),
              ),
              verticalSpace(10),
              CustomTextField(
                controller: cubit.nameCategoryController,
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
              CreateCategoryButton(),
              verticalSpace(10)
            ],
          ),
        ),
      );
    });
  }
}
