import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/core/app/upload_image/cubit/upload_cubit.dart';
import 'package:velora/core/app/upload_image/cubit/upload_state.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/style/colors/colors_dark.dart';
import 'package:velora/feature/admin/add_categories/logic/update_category/update_category_cubit.dart';

import '../../../../../../core/common/widgets/show_toast.dart';

class UpdateUploadImage extends StatelessWidget {
  const UpdateUploadImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listener: (context, state) {
        // TODO: implement listener
        state.whenOrNull(
          failure: ShowToast.showFailureToast,
          success: () {
            ShowToast.showSuccessToast(
              context.translate(LangKeys.imageUploaded),
            );
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<UploadImageCubit>();
        final image = cubit.uploadImageUrl;
        return state.maybeWhen(loading: () {
          return Container(
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.withOpacity(0.4),
            ),
            child: const Center(
              child: SpinKitFadingCube(
                color: Colors.white,
              ),
            ),
          );
        }, orElse: () {
          if (image.isNotEmpty) {
            context.read<UpdateCategoryCubit>().updatedImage = image;
          }
          return InkWell(
            onTap: cubit.uploadImage,
            borderRadius: BorderRadius.circular(15.r),
            child: Stack(
              children: [
                Container(
                  height: 120.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(cubit.uploadImageUrl.isEmpty
                            ? imageUrl
                            : cubit.uploadImageUrl)),
                  ),
                ),
                if (cubit.uploadImageUrl.isEmpty)
                  Container(
                    height: 120.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add_a_photo_outlined,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  )
              ],
            ),
          );
        });
      },
    );
  }
}
