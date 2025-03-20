part of 'update_category_cubit.dart';

@freezed
abstract class UpdateCategoryState with _$UpdateCategoryState {
  const factory UpdateCategoryState.initial() = _Initial;
  
  const factory UpdateCategoryState.loading() = LoadingState;
  const factory UpdateCategoryState.success() = SuccessState;
    const factory UpdateCategoryState.failure(ErrorHandler errorHandler) = _Error;

}
