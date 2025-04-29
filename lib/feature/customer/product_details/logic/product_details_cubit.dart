import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/feature/customer/product_details/data/repo/product_details_repo.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../data/model/product_details_response.dart';

part 'product_details_state.dart';
part 'product_details_cubit.freezed.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this._productDetailsRepo)
      : super(ProductDetailsState.loading());
  ProductDetailsRepo _productDetailsRepo;
  Future<void> productDetails({required int specProductId}) async {
    emit(ProductDetailsState.loading());
    final result =
        await _productDetailsRepo.getProductDetails(productId: specProductId);
    result.when(success: (productDetails) {
      emit(ProductDetailsState.success(
          productDetailsModel: productDetails.data.productModel));
    }, failure: (errorHandler) {
      emit(ProductDetailsState.failure(errorHandler));
    });
  }
}
