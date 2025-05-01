import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../admin/add_products/data/model/get_all_products_response.dart';
import '../data/repo/Home_category_repo.dart';

part 'get_all_category_state.dart';
part 'get_all_category_cubit.freezed.dart';

class GetAllCategoryCubit extends Cubit<GetAllCategoryState> {
  GetAllCategoryCubit(this._categoryRepo)
      : super(GetAllCategoryState.loading());
  HomeCategoryRepo _categoryRepo;
  Future<void> productDetails({required int specCategoryId}) async {
    emit(GetAllCategoryState.loading());
    final result = await _categoryRepo.getProductsByCategory(specCategoryId);
    result.when(success: (categoryItems) {
      emit(GetAllCategoryState.success(productsList: categoryItems.data.productsLsit));
    }, failure: (errorHandler) {
      emit(GetAllCategoryState.error(errorHandler));
    });
  }
}
