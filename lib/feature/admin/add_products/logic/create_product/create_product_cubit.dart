import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/feature/admin/add_products/data/repo/produccts_repo.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../data/model/create_product_request_body.dart';

part 'create_product_state.dart';
part 'create_product_cubit.freezed.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  CreateProductCubit(this._productsRepo) : super(CreateProductState.initial());
  ProductsRepo _productsRepo;
  static CreateProductCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();
  String categoryId = '';
  List<String> images = ['', '', ''];

  Future<void> createProduct() async {
    emit(const CreateProductState.loading());
    final result = await _productsRepo.createProduct(
      createProduct: CreateProductRequestModel(
        categoryId: int.parse(categoryId),
        description: descriptionController.text.trim(),
        images: images,
        price: int.parse(priceController.text.trim()),
        title: titleController.text.trim(),
      ),
    );
    result.when(
      success: (response) => emit(const CreateProductState.success()),
      failure: (e) {
        emit( CreateProductState.failure(e));
      },
    );
  }
}
