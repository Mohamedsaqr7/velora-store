import 'package:dio/dio.dart';
import 'package:velora/core/networking/api_error_handler.dart';
import 'package:velora/feature/admin/add_notifications/data/model/add_notification_model.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/services/push_notifications/firebase_cloud_messaging.dart';

class NotificationsRepo {
  Future<ApiResult<void>> sendNotification({
    required AddNotificationModel model,
  }) async {
    try {
      final result = await NotificationService.sendNotification(
         model.title??'',
         model.body??'',
        int.parse (model.productID.toString(),)
      );
      return ApiResult.success(result);
    } catch (e) {
      if (e is DioException) {
        return ApiResult.failure(ErrorHandler.handle(e));
      }
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
