import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:velora/feature/customer/cart/model/cart_model.dart';

import '../../../feature/admin/add_notifications/data/model/add_notification_model.dart';
import '../../../feature/customer/favourite/data/favourites_model.dart';

class HiveDatabase {
  HiveDatabase._();
  static final HiveDatabase _instance = HiveDatabase._();
  factory HiveDatabase() => _instance;
  Box<AddNotificationModel>? notificationBox;
  Box<FavoritesModel>? favoritesBox;
  Box<CartModel>? cartBox;
  static Future<void> setup() async {
    await Hive.initFlutter();
    Hive
      ..registerAdapter(FavoritesModelAdapter())
      ..registerAdapter(CartModelAdapter())
      ..registerAdapter(AddNotificationModelAdapter());
    _instance.notificationBox =
        await Hive.openBox<AddNotificationModel>('notificationBox');
    _instance.favoritesBox =
        await Hive.openBox<FavoritesModel>('favorites_box');
    _instance.cartBox = await Hive.openBox<CartModel>('cart_box');
  }

  Future<void> clearAllBox() async {
    await notificationBox!.clear();
    await favoritesBox!.clear();
    await cartBox!.clear();
  }
}
