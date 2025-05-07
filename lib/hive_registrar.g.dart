import 'package:hive_ce/hive.dart';
import 'package:velora/feature/admin/add_notifications/data/model/add_notification_model.dart';
import 'package:velora/feature/customer/layouts/cart/model/cart_model.dart';
import 'package:velora/feature/customer/layouts/favourite/data/favourites_model.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(AddNotificationModelAdapter());
    registerAdapter(CartModelAdapter());
    registerAdapter(FavoritesModelAdapter());
  }
}
