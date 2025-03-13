part of 'categories_cubit.dart';

@freezed
class CategoriesState with _$CategoriesState {

  const factory CategoriesState.loading() = _Loading;
  const factory CategoriesState.success({required String numbers}) = _Success;
  const factory CategoriesState.failure({required String error}) = _Error;}
