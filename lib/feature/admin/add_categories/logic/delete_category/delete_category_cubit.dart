import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../data/repos/cateories_admin_repo.dart';

part 'delete_category_state.dart';
part 'delete_category_cubit.freezed.dart';

class DeleteCategoryCubit extends Cubit<DeleteCategoryState> {
  DeleteCategoryCubit(this._repo) : super(DeleteCategoryState.initial());

  
  final CategoreisAdminRepo _repo;


  Future<void> deleteCategory({required String categoryId}
  ) async {
    emit(DeleteCategoryState.loading(id: categoryId));

    final result = await _repo.deleteCategory(categoryId: categoryId);

    result.when(
      success: (_) {
        emit(const DeleteCategoryState.success());
      },
      failure: (error) {
        emit(DeleteCategoryState.failure( error));
      },
    );
  }
}

