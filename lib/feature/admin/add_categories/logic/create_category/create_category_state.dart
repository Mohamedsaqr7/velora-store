part of 'create_category_cubit.dart';

@freezed
abstract class CreateCategoryState with _$CreateCategoryState {
  const factory CreateCategoryState.initial() = _Initial;
  const factory CreateCategoryState.loading() = _Loading;
  const factory CreateCategoryState.success() =
      _Loaded;
  const factory CreateCategoryState.failure(ErrorHandler errorHandler) = _Error;
}
