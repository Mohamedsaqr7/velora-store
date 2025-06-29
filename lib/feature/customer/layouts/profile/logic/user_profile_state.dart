part of 'user_profile_cubit.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState.success(UserRoleResponse uerRloe) = _Success;
  const factory UserProfileState.lodaing() = _Loading;
  const factory UserProfileState.failure(ErrorHandler errorHandler) = _Error;
}
