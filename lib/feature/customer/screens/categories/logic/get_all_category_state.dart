part of 'get_all_category_cubit.dart';

@freezed
class GetAllCategoryState with _$GetAllCategoryState {
  const factory GetAllCategoryState.loading() = _Loading; 
  const factory GetAllCategoryState.success({
    required List<ProductGetAllModel> productsList,
  }) = SuccessState;
  const factory GetAllCategoryState.empty() = EmptyState;
  const factory GetAllCategoryState.error(ErrorHandler errorHandler) = ErrorState;
}
