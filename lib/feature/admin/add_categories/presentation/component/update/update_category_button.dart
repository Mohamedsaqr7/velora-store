import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/feature/admin/add_categories/data/models/update_category_request_body.dart';
import 'package:velora/feature/admin/add_categories/logic/update_category/update_category_cubit.dart';

import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/show_toast.dart';

class UpdateCategoryButton extends StatelessWidget {
  const UpdateCategoryButton({
    required this.update,
    super.key,
  });
  final UpdateCategoryRequestBody update;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateCategoryCubit, UpdateCategoryState>(
      listener: (context, state) {
        // TODO: implement listener
        state.whenOrNull(
          success: () {
            context.pop();
            ShowToast.showSuccessToast(
              'Category created successfully',
            );
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
                validateUpdateForm(context);
              },
              backgroundColor: context.color.textColor,
              lastRadius: 20,
              threeRadius: 20,
              textColor: context.color.bluePinkDark,
              text: 'Update category',
              width: MediaQuery.of(context).size.width,
              height: 50.h,
            );
          },
        );
      },
    );
  }

  void validateUpdateForm(BuildContext context) {
    final updateCubit = context.read<UpdateCategoryCubit>();
    if (updateCubit.formKey.currentState!.validate()) {
      final name = updateCubit.updateCategoryNameController.text.trim();
      final image = updateCubit.updatedImage;

      if (image == '') {
        ShowToast.showFailureToast(
          'Nothing to update',
        );
        return;
      }
      updateCubit.updateCategory(
          categoryModel: UpdateCategoryRequestBody(
              name: name.isEmpty?update.name:name, image: image.isEmpty?update.image:image, id: update.id));
    }
    
  }
}
