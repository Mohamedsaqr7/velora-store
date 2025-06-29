import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/feature/admin/users/data/repo/users_repo.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../data/models/get_all_users_response.dart';

part 'get_users_state.dart';
part 'get_users_cubit.freezed.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  GetUsersCubit(this._repo) : super(GetUsersState.initial());

  final UsersRepo _repo;

  final TextEditingController searchController = TextEditingController();

  List<UsersModel> usersList = [];
  Future<void> getAllUsers() async {
    emit(const GetUsersState.loading());
    final result = await _repo.getAllUsers();
    result.when(
      success: (users) {
         usersList = users.data.usersList;
        emit(GetUsersState.succese(usersList));
      },
      failure: (e) {
        emit(GetUsersState.failure(e));
      },
    );
  }
   void searchForUser(String? searchName) {
    final query = searchName?.toLowerCase().trim() ?? '';

    final searchResult = usersList.where(
      (e) =>
          e.name!.toLowerCase().startsWith(query) ||
          e.email!.toLowerCase().startsWith(query),
    ).toList();

    if (searchResult.isEmpty) {
      emit(const GetUsersState.empty());
    } else {
      emit(GetUsersState.search( searchResult));
    }
  }
}
