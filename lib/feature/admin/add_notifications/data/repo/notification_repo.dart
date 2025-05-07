import 'package:dio/dio.dart';
import 'package:velora/core/networking/api_error_handler.dart';
import 'package:velora/feature/admin/add_notifications/data/model/add_notification_model.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/services/push_notifications/firebase_cloud_messaging.dart';

class AddNotificationDataSource {
  // Send Notification Topics to users
  Future<void> sendNotifications({
    required String body,
    required String title,
    required int productId,
  }) async {
    final response = await NotificationService.sendNotification(
      body,
      title,
      productId,
    );
    return response;
  }
}

class NotificationsRepo {
  const NotificationsRepo(this._dataSource);

  final AddNotificationDataSource _dataSource;

  // send notification to all users
  Future<ApiResult<void>> sendNotifications({
    required String title,
    required String body,
    required int productId,
  }) async {
    try {
      final response = await _dataSource.sendNotifications(
        body: body,
        productId: productId,
        title: title,
      );
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
