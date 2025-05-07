import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/core/networking/api_error_handler.dart';
import 'package:velora/feature/auth/login/data/model/user_role_response.dart';
import 'package:velora/feature/customer/layouts/profile/data/repos/profile_repo.dart';

part 'user_profile_state.dart';
part 'user_profile_cubit.freezed.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this._profileRepo) : super(UserProfileState.lodaing());
  ProfileRepo _profileRepo;
  Future<void> getUserInfo() async {
    emit(const UserProfileState.lodaing());
    final result = await _profileRepo.getUserProfile();
    result.when(
      success: (userData) {
        emit(UserProfileState.success(userData));
      },
      failure: (error) {
        emit( UserProfileState.failure(error));
      },
    );
  }
}
