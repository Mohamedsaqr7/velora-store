import 'package:hive_ce/hive.dart';
import 'package:velora/feature/admin/add_notifications/data/model/add_notification_model.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(AddNotificationModelAdapter());
  }
}
