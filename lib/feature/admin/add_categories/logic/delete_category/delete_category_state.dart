part of 'delete_category_cubit.dart';

@freezed
abstract class DeleteCategoryState with _$DeleteCategoryState {
  const factory DeleteCategoryState.initial() = _Initial;
  
  const factory DeleteCategoryState.loading({required String id}) = _Loading;
  const factory DeleteCategoryState.success() = _Success;
  const factory DeleteCategoryState.failure(ErrorHandler errorHandler) = _Failure;
}
