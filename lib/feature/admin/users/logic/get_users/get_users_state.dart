part of 'get_users_cubit.dart';

@freezed
abstract class GetUsersState with _$GetUsersState {
  const factory GetUsersState.initial() = _Initial;
  const factory GetUsersState.empty() = _Empty;
  const factory GetUsersState.loading() = _Loading;
  const factory GetUsersState.succese(List<UsersModel>uuserList) = _Success;
  const factory GetUsersState.search(List<UsersModel>uuserList) = _Search;
  const factory GetUsersState.failure(ErrorHandler errorHandler) = _Failure;
}
