import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../data/models/get_all_categories_response.dart';
import '../../data/repos/cateories_admin_repo.dart';

part 'get_categories_state.dart';
part 'get_categories_cubit.freezed.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this._catRepo) : super(GetCategoriesState.initial());
  CategoreisAdminRepo _catRepo;
  void getCategories() async {
    emit(GetCategoriesState.loading());
    final response = await _catRepo.getCategories();
    response.when(
      success: (catModel) {
        emit(GetCategoriesState.success(
            catModel.data.categories.reversed.toList()));
      },
      failure: (e) {
        emit(GetCategoriesState.failure(e));
      },
    );
  }
}
