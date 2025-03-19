import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/feature/admin/add_categories/data/models/create_categories_request_body.dart';
import 'package:velora/feature/admin/add_categories/data/models/create_categories_response.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../data/repos/cateories_admin_repo.dart';

part 'create_category_state.dart';
part 'create_category_cubit.freezed.dart';

class CreateCategoryCubit extends Cubit<CreateCategoryState> {
  CreateCategoryCubit(this._adminRepo) : super(CreateCategoryState.initial());
  static CreateCategoryCubit get(context) => BlocProvider.of(context);
  final CategoreisAdminRepo _adminRepo;
  final formkey = GlobalKey<FormState>();
  TextEditingController nameCategoryController = TextEditingController();
  String categoryImage = '';
  Future<void> createNewCategory() async {
    emit(const CreateCategoryState.loading());
    final result = await _adminRepo.createCategory(
        createCategoryModel: CreateCategoryRequestModel(
            name: nameCategoryController.text, image: categoryImage));
    result.when(
      success: (response) => emit(const CreateCategoryState.success()),
      failure: (e) {
        emit(CreateCategoryState.failure(e));
      },
    );
  }
}
