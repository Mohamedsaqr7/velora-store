import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_state.freezed.dart';
@freezed
class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.loading() = _Loading;
  const factory UploadImageState.success() = _Success;
  const factory UploadImageState.loadingImageAtIndex(int index) =
      _LoadingImageAtIndex;
  const factory UploadImageState.delete() = _Delete;
  const factory UploadImageState.failure({required String error}) = ErrorState;
}
