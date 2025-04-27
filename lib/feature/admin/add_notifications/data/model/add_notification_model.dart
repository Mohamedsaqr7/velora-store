import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_ce/hive.dart';
part 'add_notification_model.g.dart';
@HiveType(typeId: 0)
class AddNotificationModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? body;
  @HiveField(2)
  int? productID;
  @HiveField(3)
  final DateTime createdAt;
  AddNotificationModel(
      {this.title, this.body, this.productID, required this.createdAt});
}
