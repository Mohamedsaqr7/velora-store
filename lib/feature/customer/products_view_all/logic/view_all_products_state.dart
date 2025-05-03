import 'package:equatable/equatable.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../admin/add_products/data/model/get_all_products_response.dart';

abstract class ProductsViewAllState extends Equatable {
  final List<ProductGetAllModel> productsList;
  final bool hasMoreData;

  const ProductsViewAllState({
    required this.productsList,
    required this.hasMoreData,
  });

  @override
  List<Object?> get props => [productsList, hasMoreData];
}

class ProductsViewAllInitial extends ProductsViewAllState {
  const ProductsViewAllInitial()
      : super(productsList: const [], hasMoreData: true);
}

class ProductsViewAllLoading extends ProductsViewAllState {
  const ProductsViewAllLoading({
    required super.productsList,
    required super.hasMoreData,
  });
}

class ProductsViewAllSuccess extends ProductsViewAllState {
  const ProductsViewAllSuccess({
    required super.productsList,
    required super.hasMoreData,
  });
}

class ProductsViewAllError extends ProductsViewAllState {
 final ErrorHandler errorHandler;

  const ProductsViewAllError({
    required this.errorHandler,
    required super.productsList,
    required super.hasMoreData,
  });

  @override
  List<Object?> get props => [productsList, hasMoreData,  errorHandler];
}
