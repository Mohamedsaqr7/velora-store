part of 'send_notification_cubit.dart';

@freezed
abstract class SendNotificationState with _$SendNotificationState {
  const factory SendNotificationState.initial() = _Initial;
  const factory SendNotificationState.loading({required int indexId}) =
      _Loading;
  const factory SendNotificationState.success() = _Success;
  const factory SendNotificationState.failure(ErrorHandler errorHandler) =
      _Error;
}
