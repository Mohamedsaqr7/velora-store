part of 'product_details_cubit.dart';

@freezed
class ProductDetailsState with _$ProductDetailsState {
   const factory ProductDetailsState.loading() = _Loading;
  const factory ProductDetailsState.success({required ProductDetailsModel productDetailsModel}) =
      _Loaded;
  const factory ProductDetailsState.failure(ErrorHandler errorHandler) = _Error;

}
