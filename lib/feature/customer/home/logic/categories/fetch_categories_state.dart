part of 'fetch_categories_cubit.dart';

@freezed
class FetchCategoriesState with _$FetchCategoriesState {
  const factory FetchCategoriesState.loading() = _Loading;
  const factory FetchCategoriesState.success(List<Category>category) = _Success;
  const factory FetchCategoriesState.error(ErrorHandler error) = _Error;
}
