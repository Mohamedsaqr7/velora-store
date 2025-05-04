import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/core/networking/api_error_handler.dart';
import 'package:velora/feature/customer/search/data/repo/search_repo.dart';

import '../../../../core/enums/filter_button_enum.dart';
import '../../../admin/add_products/data/model/get_all_products_response.dart';
import '../data/models/search_request_body.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchState.initial());
  SearchRepo _searchRepo;
  TextEditingController productNameController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();
  
  final fromKey = GlobalKey<FormState>();
  Future<void> searchProducts() async {
    emit(const SearchState.loading());
    final response = await _searchRepo.searchProducts(
      SearchRequestBody(
        searchName: productNameController.text.isEmpty?null: productNameController.text,
        priceMin:  minPriceController.text.isEmpty ? null : int.parse(minPriceController.text),
        priceMax:  maxPriceController.text.isEmpty ? null : int.parse(maxPriceController.text),
      ),
    );
    response.when(success: (data) {
      if (data.data.productsLsit.isEmpty) {
        emit(const SearchState.empty());
      } else {
        emit(SearchState.success(productsList: data.data.productsLsit));
      }
    }, failure: (errorHandler) {
      emit(SearchState.error(errorHandler));
    });
  }
}
