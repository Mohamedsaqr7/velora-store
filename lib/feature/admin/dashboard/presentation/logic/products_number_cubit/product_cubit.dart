import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/language/lang_keys.dart';
import '../../../data/repo/dashboard_repo.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._dashboardRepo) : super(const ProductState.loading());
   DashboardRepo _dashboardRepo;
  Future<void> fetchNumberOfProducts() async {
    emit(const ProductState.loading());
    final result = await _dashboardRepo.numberOfProducts();
    result.when(
      success: (data) =>
          emit(ProductState.success(numbers: data.productsNumber)),
      failure: (error) {emit(ProductState.failure(error: 
        error.apiErrorModel.message ??'${LangKeys.loggedError}'
      ));
      },
    );
  }
}
