part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {const factory SearchState.initial() = Initial;
  const factory SearchState.loading() = LoadinState;
  const factory SearchState.success({
    required List<ProductGetAllModel> productsList,
  }) = SuccessState;
  const factory SearchState.empty() = EmptyState;
  const factory SearchState.error(ErrorHandler error) = ErrorState;
}