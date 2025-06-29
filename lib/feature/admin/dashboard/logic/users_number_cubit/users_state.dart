part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.loading() = _Loading;
  const factory UsersState.success({required String numbers}) = _Success;
  const factory UsersState.failure({required String error}) = _Error;
}
