part of 'delete_user_cubit.dart';

@freezed
class DeleteUserState with _$DeleteUserState {
  const factory DeleteUserState.initial() = _Initial;
  const factory DeleteUserState.loading({required String userId}) = _Loading;
  const factory DeleteUserState.success() = _Success;
  const factory DeleteUserState.failure(ErrorHandler errorHandler) = _Failure;
}
