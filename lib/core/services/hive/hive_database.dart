import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';

import '../../../feature/admin/add_notifications/data/model/add_notification_model.dart';

class HiveDatabase {
  HiveDatabase._();
  static final HiveDatabase _instance = HiveDatabase._();
  factory HiveDatabase() => _instance;
  Box<AddNotificationModel>? notificationBox;
  static Future<void> setup() async {
    await Hive.initFlutter();
    Hive.registerAdapter(AddNotificationModelAdapter());
    _instance.notificationBox =
        await Hive.openBox<AddNotificationModel>('notificationBox');
  }

  Future<void> clearAllBox() async {
    await notificationBox!.clear();
  }
}
