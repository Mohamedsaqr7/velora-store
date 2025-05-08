import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:velora/core/constants/app_constants.dart';
import 'package:velora/core/constants/secure_keys.dart';
import 'package:velora/core/constants/secure_storage.dart';
import 'package:velora/feature/customer/notifications/data/model/notification_model.dart';

class NotificationController {
  NotificationController();

  // ضع الـ print داخل دالة أو في مكان مناسب، هنا مثال داخل constructor
  void logUserId() {
    print('UserId: ${SharedPref().getInt(SecureKeys.userId)}');
  }

  final notificationDataBase = FirebaseFirestore.instance
      .collection(usersCollection)
      // التأكد من أن userId موجود وإلا تعيين قيمة افتراضية
      .doc(SharedPref().getString(SecureKeys.userId)?.toString())
      .collection(notificationCollection)
      .orderBy('created_at', descending: true);

  Stream<List<NotificationModel>> getNotificationList() {
    return notificationDataBase.snapshots().map((value) {
      return value.docs.map((doc) {
        final data = doc.data();
        return NotificationModel.fromJson(data);
      }).toList();
    });
  }
}
