import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../data/repo/users_repo.dart';

part 'delete_user_state.dart';
part 'delete_user_cubit.freezed.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> {
  DeleteUserCubit(this._repo) : super(DeleteUserState.initial());
  final UsersRepo _repo;
  Future<void>deleteUser({required String userId}) async {
    emit(DeleteUserState.loading(userId: userId));
    final result = await _repo.deleteUser(userId: userId);
    result.when(
      success: (data) {
        emit(const DeleteUserState.success());
      },
      failure: (e) {
        emit(DeleteUserState.failure(e));
      },
    );
  }
}
