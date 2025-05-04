
import 'package:hive_ce_flutter/hive_flutter.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 2)
class CartModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final String price;

  @HiveField(4)
  final int quantity;
  @HiveField(5)
  final String categoryName;

  CartModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
       required this.categoryName,
  });

  CartModel copyWith({int? quantity}) {
    return CartModel(categoryName: categoryName,
      id: id,
      title: title,
      image: image,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}
