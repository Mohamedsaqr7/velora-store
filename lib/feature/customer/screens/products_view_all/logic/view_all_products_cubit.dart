import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/feature/customer/screens/products_view_all/logic/view_all_products_state.dart';

import '../data/view_all_products_repo.dart';

class ProductsViewAllCubit extends Cubit<ProductsViewAllState> {
  ProductsViewAllCubit(this._repo) : super(const ProductsViewAllInitial());

  final ViewAllProductsRepo _repo;
  int offset = 6;

  Future<void> getProductsViewAll() async {
    emit(const ProductsViewAllLoading(productsList: [], hasMoreData: true));
    offset = 0;

    final result = await _repo.ViewAllProducts(offset: 0);

    result.when(
      success: (data) {
        emit(ProductsViewAllSuccess(
            productsList: data.data.productsLsit, hasMoreData: true));
      },
      failure: (error) {
        emit(ProductsViewAllError(
          errorHandler: error,
          productsList: [],
          hasMoreData: true,
        ));
      },
    );
  }

  Future<void> loadMoreProducts() async {
    if (state is ProductsViewAllSuccess && state.hasMoreData) {
      offset += 6;

      emit(ProductsViewAllLoading(
        productsList: state.productsList,
        hasMoreData: state.hasMoreData,
      ));

      final result = await _repo.ViewAllProducts(offset: offset);

      result.when(
        success: (data) {
          final newList = [...state.productsList, ...data.data.productsLsit];
          emit(ProductsViewAllSuccess(
            productsList: newList,
            hasMoreData: !(data.data.productsLsit.length < 6),
          ));
        },
        failure: (error) {
          emit(ProductsViewAllError(
            errorHandler: error,
            productsList: state.productsList,
            hasMoreData: state.hasMoreData,
          ));
        },
      );
    }
  }

  void handlerPagination({
    required ScrollController scrollController,
    required double loadMorePosition,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final offset = scrollController.offset;
      final maxExtent = scrollController.position.maxScrollExtent;

      if (offset >= maxExtent - loadMorePosition) {
        loadMoreProducts();
      }
    });
  }
}
