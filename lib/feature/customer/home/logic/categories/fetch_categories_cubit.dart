import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/feature/customer/home/data/repo/customer_home_repo.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../../admin/add_categories/data/models/get_all_categories_response.dart';

part 'fetch_categories_state.dart';
part 'fetch_categories_cubit.freezed.dart';

class FetchCategoriesCubit extends Cubit<FetchCategoriesState> {
  FetchCategoriesCubit(this._customerHomeRepo)
      : super(FetchCategoriesState.loading());
  CustomerHomeRepo _customerHomeRepo;
  void getCategories() async {
    emit(FetchCategoriesState.loading());
    final response = await _customerHomeRepo.getCategories();
    response.when(
      success: (categoryModel) {
        emit(FetchCategoriesState.success(categoryModel.data.categories));
      },
      failure: (e) {
        emit(FetchCategoriesState.error(e));
      },
    );
  }
}
