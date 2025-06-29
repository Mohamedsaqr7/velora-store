part of 'create_product_cubit.dart';

@freezed
abstract class CreateProductState with _$CreateProductState {
  const factory CreateProductState.initial() = _Initial;
  const factory CreateProductState.loading() = _Loading;
  const factory CreateProductState.success() = _Success;
  const factory CreateProductState.failure(ErrorHandler errorHandler) = _Failure;
}
