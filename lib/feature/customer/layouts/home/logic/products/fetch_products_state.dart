part of 'fetch_products_cubit.dart';

@freezed
class FetchProductsState with _$FetchProductsState {
  const factory FetchProductsState.loading() = _Loading;
  const factory FetchProductsState.success(List<ProductGetAllModel> productList) = _Success;
  const factory FetchProductsState.error(ErrorHandler error) = _Error;
}
