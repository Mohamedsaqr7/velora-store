import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/core/app/upload_image/cubit/upload_cubit.dart';
import 'package:velora/core/app/upload_image/cubit/upload_state.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';

import '../../../../../../core/common/widgets/show_toast.dart';
import '../../../../../../core/style/theme/spacing.dart';

class CreateProductImages extends StatelessWidget {
  const CreateProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => verticalSpace(6),
      itemBuilder: (context, index) {
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
            return state.maybeWhen(
              loadingImageAtIndex: (indexId) {
                if (indexId == index) {
                  return Container(
                    height: 90.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Center(
                      child: SpinKitFadingCube(
                        color: Colors.white,
                        size: 30.sp,
                      ),
                    ),
                  );
                }
                return SelectProductImage(
                  index: index,
                  onTap: () {},
                );
              },
              orElse: () {
                return SelectProductImage(
                  index: index,
                  onTap: () {
                    context.read<UploadImageCubit>().uploadMultipleImage(index);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

class SelectProductImage extends StatelessWidget {
  const SelectProductImage({
    super.key,
    required this.index,
    required this.onTap,
  });
  final int index;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return context.read<UploadImageCubit>().imagesUrls[index].isNotEmpty
        ? Container(
            height: 90.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(15.r),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  context.read<UploadImageCubit>().imagesUrls[index],
                ),
              ),
            ),
          )
        : InkWell(
            onTap: onTap,
            child: Container(
              height: 90.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(
                child: Icon(
                  Icons.add_a_photo_outlined,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
          );
  }
}
