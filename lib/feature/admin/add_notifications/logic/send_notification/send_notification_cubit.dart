import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/core/networking/api_result.dart';
import 'package:velora/feature/admin/add_notifications/data/model/add_notification_model.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../data/repo/notification_repo.dart';

part 'send_notification_state.dart';
part 'send_notification_cubit.freezed.dart';

class SendNotificationCubit extends Cubit<SendNotificationState> {
  SendNotificationCubit(this.notificationsRepo)
      : super(SendNotificationState.initial());
  NotificationsRepo notificationsRepo;
  Future<void> sendNotification(
      {required AddNotificationModel addNotificationModel,
      required int loadingAtIndex}) async {
    emit(SendNotificationState.loading(indexId: loadingAtIndex));

    final result = await notificationsRepo.sendNotifications(
        body: addNotificationModel.body ?? '',
        title: addNotificationModel.title ?? '',
        productId: int.parse(addNotificationModel.productID.toString()));
    result.when(
      success: (_) {
        emit(SendNotificationState.success());
      },
      failure: (errorHandler) {
        print('❌ Notification Send Failed: ${errorHandler.apiErrorModel}');
        emit(SendNotificationState.failure(errorHandler));
      },
    );
  }
}
