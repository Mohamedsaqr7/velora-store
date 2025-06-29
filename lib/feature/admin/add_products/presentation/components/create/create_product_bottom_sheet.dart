import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/custom_drop_down.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/add_categories/logic/get_category/get_categories_cubit.dart';
import 'package:velora/feature/admin/add_products/logic/create_product/create_product_cubit.dart';
import 'package:velora/feature/admin/add_products/presentation/components/create/ccreate_product_drop_down.dart';
import 'package:velora/feature/admin/add_products/presentation/components/create/create_product_images.dart';
import 'package:velora/feature/admin/add_products/presentation/components/update/update_product_images.dart';

import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family.dart';
import 'create_product_button.dart';

class CreateProductBottomSheet extends StatefulWidget {
  const CreateProductBottomSheet({super.key});

  @override
  State<CreateProductBottomSheet> createState() =>
      _CreateProductBottomSheetState();
}

class _CreateProductBottomSheetState extends State<CreateProductBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CreateProductCubit>();
    return SizedBox(
      height: 600.h,
      child: Form(
        key: cubit.formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextApp(
                  text: 'Create Product',
                  theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeightHelper.bold,
                    fontFamily: FontFamily.geLocalozedFontFamily(),
                  ),
                ),
              ),
              verticalSpace(20),
              TextApp(
                text: 'Create a photos',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                ),
              ),
              CreateProductImages(),
              TextApp(
                text: 'Title',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                ),
              ),
              verticalSpace(15), // Title
              CustomTextField(
                controller: cubit.titleController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Title',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Please Selected Your Product Title';
                  }
                  return null;
                },
              ),
              verticalSpace(15.h),
              TextApp(
                text: 'Price',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                ),
              ),
              verticalSpace(15), // Price
              CustomTextField(
                controller: cubit.priceController,
                keyboardType: TextInputType.number,
                hintText: 'Price',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Selected Your Product Price';
                  }
                  return null;
                },
              ),
              verticalSpace(15),
              TextApp(
                text: 'Description',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                ),
              ),
              verticalSpace(15), //Description
              CustomTextField(
                controller: cubit.descriptionController,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                hintText: 'Description',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Please Selected Your Product description';
                  }
                  return null;
                },
              ),
              verticalSpace(15),
              TextApp(
                text: 'Category',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                ),
              ),
              verticalSpace(15),
              BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    success: (categories) {
                      return CustomCreateDropDown(
                        value: cubit.categoryId,
                        items: categories.map((e) => e.name ?? '').toList(),
                        hintText: 'Select Category',
                        onChanged: (value) {
                          cubit.categoryId = categories
                              .firstWhere((element) => element.name == value)
                              .id;
                        },
                      );
                    },
                  );
                },
              ),
              CcreateProductDropDown(),
              verticalSpace(15),
              CreateProductButton(),
              verticalSpace(15),
            ],
          ),
        ),
      ),
    );
  }
}
