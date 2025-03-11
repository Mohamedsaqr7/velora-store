import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/app/upload_image/cubit/upload_cubit.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/utils/image_picker.dart';

import '../../../../../../core/app/upload_image/cubit/upload_state.dart';

class UserAvatarScreen extends StatelessWidget {
  const UserAvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: BlocConsumer<UploadImageCubit, UploadImageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = context.read<UploadImageCubit>();
          var imageUploaded = cubit.uploadImageUrl.isNotEmpty;
          // context.read<UploadImageCubit>().add(context)
          return state.maybeWhen(loading: () {
            return CircleAvatar(
              backgroundColor: Colors.grey.shade400,
              radius: 40.r,
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          }, orElse: () {
            return CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.2),
              backgroundImage: cubit.uploadImageUrl != ''
                  ? NetworkImage(cubit.uploadImageUrl)
                  : AssetImage(AppAssets.userAvatar),
              radius: 38.r,
              child: Stack(
                children: [
                  //remove image
                  if (cubit.uploadImageUrl.isNotEmpty)
                    Positioned(
                      top: -15,
                      right: -15,
                      child: IconButton(
                        onPressed: () {
                          context.read<UploadImageCubit>().deleteImage();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    )
                  else
                    const SizedBox.shrink(),
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: imageUploaded
                          ? Colors.transparent
                          : Colors.black.withOpacity(0.4),
                    ),
                  ),
                  //add image
                  if (imageUploaded)
                    const SizedBox.shrink()
                  else
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: imageUploaded
                              ? Colors.transparent
                              : Colors.black.withOpacity(0.4)),
                      child: IconButton(
                          onPressed: () {
                            return cubit.uploadImage();
                          },
                          icon: Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                          )),
                    )
                ],
              ),
            );
          });
        },
      ),
    );
  }
}
