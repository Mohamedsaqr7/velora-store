part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.loading() = _Loading;
  const factory ProductState.success({required String numbers}) = _Success;
  const factory ProductState.failure({required String error}) = _Error;
}
