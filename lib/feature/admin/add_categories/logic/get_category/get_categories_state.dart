part of 'get_categories_cubit.dart';

@freezed
class GetCategoriesState with _$GetCategoriesState {
  const factory GetCategoriesState.initial() = _Initial;

  const factory GetCategoriesState.loading() = _Loading;
  const factory GetCategoriesState.success(
      List<Category> categoriesDataList) = _Success;
  const factory GetCategoriesState.failure(ErrorHandler errorHandler) = _Error;
}
