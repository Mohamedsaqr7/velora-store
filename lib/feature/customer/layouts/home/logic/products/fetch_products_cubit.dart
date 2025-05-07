import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/feature/customer/layouts/home/data/repo/customer_home_repo.dart';

import '../../../../../../core/networking/api_error_handler.dart';
import '../../../../../admin/add_products/data/model/get_all_products_response.dart';

part 'fetch_products_state.dart';
part 'fetch_products_cubit.freezed.dart';

class FetchProductsCubit extends Cubit<FetchProductsState> {
  FetchProductsCubit(this._customerHomeRepo)
      : super(FetchProductsState.loading());
  CustomerHomeRepo _customerHomeRepo;
  bool isProductsSmallerThan10 = false;
  Future<void> getAllProducts() async {
    final result = await _customerHomeRepo.getAllProducts();
    result.when(
      success: (response) {
        isProductsSmallerThan10 = response.data.productsLsit.length >= 10;
        emit(FetchProductsState.success(response.data.productsLsit));
      },
      failure: (errorHandler) => emit(
        FetchProductsState.error(errorHandler),
      ),
    );
  }
}
