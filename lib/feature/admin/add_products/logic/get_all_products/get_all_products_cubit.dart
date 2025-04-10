import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/feature/admin/add_products/data/repo/produccts_repo.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../data/model/get_all_products_response.dart';

part 'get_all_products_state.dart';
part 'get_all_products_cubit.freezed.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit(this._productsRepo)
      : super(GetAllProductsState.loading());
  ProductsRepo _productsRepo;
  static GetAllProductsCubit get(context) => BlocProvider.of(context);
  ProductGetAllModel? dataModel;
  Future<void> getAllProducts() async {
    final result = await _productsRepo.getAllProducts();
    result.when(
      success: (response) => emit(GetAllProductsState.success(
          response.data.productsLsit.reversed.toList())),
      failure: (errorHandler) => emit(
        GetAllProductsState.failure(errorHandler),
      ),
    );
  }
}
