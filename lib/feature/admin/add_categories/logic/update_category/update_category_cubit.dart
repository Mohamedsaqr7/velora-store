import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../data/models/update_category_request_body.dart';
import '../../data/repos/cateories_admin_repo.dart';    

part 'update_category_state.dart';
part 'update_category_cubit.freezed.dart';

class UpdateCategoryCubit extends Cubit<UpdateCategoryState> {
  UpdateCategoryCubit(this._catRepo) : super(UpdateCategoryState.initial());
  final CategoreisAdminRepo _catRepo;
    static UpdateCategoryCubit get(context) => BlocProvider.of(context);

  String updatedImage = '';
  TextEditingController updateCategoryNameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future updateCategory(
      {required UpdateCategoryRequestBody categoryModel}) async {
    emit(const UpdateCategoryState.loading());
    final result = await _catRepo.updateCategory(categoryModel: categoryModel);
    result.when(
      success: (response) => emit(const UpdateCategoryState.success()),
      failure: (e) {
        emit(UpdateCategoryState.failure(e));
      },
    );
  }
}
