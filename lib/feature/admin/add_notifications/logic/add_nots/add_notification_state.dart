part of 'add_notification_cubit.dart';

@freezed
class AddNotificationState with _$AddNotificationState {
  const factory AddNotificationState.initial() = _Initial;
  const factory AddNotificationState.loading() = _Loading;
  const factory AddNotificationState.success() = _Success;
  const factory AddNotificationState.error({required String error}) = _Failure;
}
