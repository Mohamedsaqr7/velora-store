import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/language/lang_keys.dart';
import '../../data/repo/dashboard_repo.dart';

part 'users_state.dart';
part 'users_cubit.freezed.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._dashboardRepo) : super( const UsersState.loading());
   DashboardRepo _dashboardRepo;
  Future<void> fetchNumberOfUsers() async {
    emit(const UsersState.loading());
    final result = await _dashboardRepo.numberOfUsers();
    result.when(
      success: (data) =>
          emit( UsersState.success(numbers: data.usersNumber)),
      failure: (error) {emit( UsersState.failure(error: 
        error.apiErrorModel.message ??'${LangKeys.loggedError}'
      ));
      },
    );
  }
}
