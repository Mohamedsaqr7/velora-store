import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/app/upload_image/cubit/upload_cubit.dart';
import 'package:velora/core/app/upload_image/cubit/upload_state.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/feature/admin/add_categories/logic/create_category/create_category_cubit.dart';
import '../../../../../../core/common/widgets/show_toast.dart';

class CategoryUploadImage extends StatelessWidget {
  const CategoryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        // TODO: implement listener
        state.whenOrNull(
          failure: ShowToast.showFailureToast,
          delete: () {
            ShowToast.showFailureToast(
              context.translate(LangKeys.imageRemoved),
            );
          },
          success: () {
            ShowToast.showSuccessToast(
              context.translate(LangKeys.imageUploaded),
            );
          },
        );
      },
      builder: (context, state) {
        var cubit = context.read<UploadImageCubit>();
        final image = cubit.uploadImageUrl;
        return state.maybeWhen(loading: () {
          return Container(
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.withOpacity(0.4),
            ),
            child: const Center(
              child: SpinKitCircle(
                color: Colors.white,
              ),
            ),
          );
        }, orElse: () {
          if (image.isNotEmpty) {
            context.read<CreateCategoryCubit>().categoryImage = image;
            return Container(
              height: 120.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15),
                image:
                    DecorationImage(fit: BoxFit.fill, image: NetworkImage(image)
                        // fit: BoxFit.fill,
                        ),
              ),
            );
          } else {
            return InkWell(
              onTap: () {
                context.read<UploadImageCubit>().uploadImage();
              },
              child: Container(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.add_a_photo_outlined,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            );
          }
        });
      },
    );
  }
}
