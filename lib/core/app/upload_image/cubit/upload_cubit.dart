
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/app/upload_image/cubit/upload_state.dart';
import 'package:velora/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:velora/core/utils/image_picker.dart';

import '../../../language/lang_keys.dart';


class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this.uploadImageRepo)
      : super(const UploadImageState.initial());
  final UploadImageRepo uploadImageRepo;

  String uploadImageUrl = '';

  // Upload Image
   uploadImage() async {
    // pick the image
    final image = await PickImageUtil.pickImage();
    if (image == null) return;
    // upload the image
    emit(const UploadImageState.loading());
    final result = await uploadImageRepo.uploadImage(imageFile: image);
    result.when(
      success: (data) {
        uploadImageUrl = data.location??'';
        emit(const UploadImageState.success());
      },
      failure: (error) {
        emit(UploadImageState.failure( error: error.apiErrorModel.message ?? '${LangKeys.no}' ));
      },
    );
  }

  // delete the image
  void deleteImage() {
    uploadImageUrl = '';
    emit(const UploadImageState.delete());
  }
}