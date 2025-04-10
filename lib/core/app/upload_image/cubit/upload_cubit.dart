import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/app/upload_image/cubit/upload_state.dart';
import 'package:velora/core/app/upload_image/repo/upload_image_repo.dart';
import 'package:velora/core/utils/image_picker.dart';

import '../../../language/lang_keys.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._uploadImageRepo)
      : super(const UploadImageState.initial());
  final UploadImageRepo _uploadImageRepo;

  String uploadImageUrl = '';
  // List<String>imagelist=['']

  // Upload Image
  uploadImage() async {
    // pick the image
    final image = await PickImageUtil.pickImage();
    if (image == null) return;
    // upload the image
    emit(const UploadImageState.loading());
    final result = await _uploadImageRepo.uploadImage(imageFile: image);
    result.when(
      success: (data) {
        uploadImageUrl = data.location ?? '';
        emit(const UploadImageState.success());
      },
      failure: (error) {
        emit(UploadImageState.failure(
            error: error.apiErrorModel.message ?? '${LangKeys.no}'));
      },
    );
  }
  
  // upload multiple images
  List<String> imagesUrls = ['', '', ''];
  Future<void> uploadMultipleImage(int index) async {
    // pick the image
    final image = await PickImageUtil.pickImage();
    if (image == null) return;
    // upload the image
    emit(UploadImageState.loadingImageAtIndex(index));
    final result = await _uploadImageRepo.uploadImage(imageFile: image);
    result.when(
      success: (data) {
        imagesUrls[index] = data.location??'';
        emit(const UploadImageState.success());
      },
      failure: (failure) {
        emit(UploadImageState.failure(
            error: failure.apiErrorModel.message ?? '${LangKeys.no}'));
      },
    );
  }

  // delete the image
  void deleteImage() {
    uploadImageUrl = '';
    emit(const UploadImageState.delete());
  }
}
