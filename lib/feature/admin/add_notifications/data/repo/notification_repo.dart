import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:velora/core/constants/app_constants.dart';
import 'package:velora/core/extensions/strring_extension.dart';
import 'package:velora/core/networking/api_error_handler.dart';
import 'package:velora/core/utils/app_value.dart';
import 'package:velora/feature/admin/add_notifications/data/model/add_notification_model.dart';

import '../../../../../core/networking/api_result.dart';
import '../../../../../core/services/push_notifications/firebase_cloud_messaging.dart';
import '../../../../customer/notifications/data/model/notification_model.dart';

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
 // add Notifications to all users in firebase data base

  Future<void> addNotificationsToAllUsersFirebase({
    required String body,
    required String title,
    required int productId,
  }) async {
    final notificationId = AppValues.randomStringId;
    const createAt = '';

    final users = FirebaseFirestore.instance.collection(usersCollection);

    final usersGet = await users.get();

    for (final doc in usersGet.docs) {
      await users
          .doc(doc.id)
          .collection(notificationCollection)
          .doc(notificationId)
          .set(
            NotificationModel(
              body: body,
              title: title,
              productId: productId,
              isSeen: false,
              createdAt: createAt.convertDataFormate(),
              notificationId: notificationId,
            ).toJson(),
          );
    }
  }}
