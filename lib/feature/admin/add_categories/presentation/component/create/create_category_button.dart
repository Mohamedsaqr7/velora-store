import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/feature/admin/add_categories/logic/create_category/create_category_cubit.dart';

import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/show_toast.dart';

class CreateCategoryButton extends StatelessWidget {
  const CreateCategoryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateCategoryCubit, CreateCategoryState>(
      listener: (context, state) {
        state.whenOrNull(
          success: () {
            ShowToast.showSuccessToast(
              'Category created successfully',
            );
            context.pop();
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return Container(
              height: 50.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: SpinKitThreeInOut(
                  color: context.color.mainColor,
                  size: 20,
                ),
              ),
            );
          },
          orElse: () {
            return CustomButton(
              onPressed: () {
                validateCreateCategory(context);
              },
              backgroundColor: context.color.textColor,
              lastRadius: 20,
              threeRadius: 20,
              textColor: context.color.bluePinkDark,
              text: 'Create a new category',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            );
          },
        );
      },
    );
  }
}

void validateCreateCategory(BuildContext context) {
  final image = context.read<CreateCategoryCubit>().categoryImage;
  final categoryName =
      context.read<CreateCategoryCubit>().nameCategoryController.text.trim();
  if (context.read<CreateCategoryCubit>().formkey.currentState!.validate() &&
      categoryName.isNotEmpty) {
    if (image.isEmpty || image == '') {
      ShowToast.showFailureToast(
        context.translate(LangKeys.validPickImage),
      );
      return;
    }
    context.read<CreateCategoryCubit>()..createNewCategory();
  }
}
