part of 'get_all_products_cubit.dart';

@freezed
abstract class GetAllProductsState with _$GetAllProductsState {
  const factory GetAllProductsState.loading() = _Loading;
  const factory GetAllProductsState.success( List<ProductGetAllModel> productList) = _Success;
  const factory GetAllProductsState.failure(ErrorHandler errorHandler) = _Failure;
}
