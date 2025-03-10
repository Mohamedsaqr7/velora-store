import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velora/core/networking/api_result.dart';
import 'package:velora/core/networking/api_service.dart';

import '../../../networking/api_error_handler.dart';
import '../model/upload_image_response.dart';

class UploadImageRepo {
  final ApiService _apiService;

  UploadImageRepo(this._apiService);
  Future<ApiResult<UploadImageResourse>> uploadImage(
      {required XFile imageFile}) async {
    try {
      final formdata = await convertImageToFormData(imageFile);
      final response = await _apiService.uploadImage(formdata);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }

  Future<FormData> convertImageToFormData(XFile file) async {
    final formdata = FormData();
    formdata.files
        .add(MapEntry('file', await MultipartFile.fromFile(file.path)));
    return formdata;
  }
}
