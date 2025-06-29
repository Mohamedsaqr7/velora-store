part of 'get_notification_cubit.dart';

@freezed
class GetNotificationState with _$GetNotificationState {
  
  const factory GetNotificationState.loading() = _Loading;
  const factory GetNotificationState.empty() = _Empty;
  const factory GetNotificationState.success({required List<AddNotificationModel>notificationList}) = _Success;
  const factory GetNotificationState.error({required String error}) = _Failure;
}
