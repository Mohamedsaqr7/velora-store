import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/feature/admin/dashboard/data/repo/dashboard_repo.dart';

import '../../../../../core/language/lang_keys.dart';

part 'categories_state.dart';
part 'categories_cubit.freezed.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._dashboardRepo) : super(const CategoriesState.loading());
  DashboardRepo _dashboardRepo;
  Future<void> fetchNumberOfCategories() async {
    emit(const CategoriesState.loading());
    final result = await _dashboardRepo.numberOfCategories();
    result.when(
      success: (data) =>
          emit(CategoriesState.success(numbers: data.categoriesNumber)),
      failure: (error) {
        error.apiErrorModel.message ?? '${LangKeys.loggedError}';
      },
    );
  }
}
