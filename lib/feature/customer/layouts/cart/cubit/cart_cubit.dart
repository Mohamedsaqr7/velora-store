import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/core/services/hive/hive_database.dart';
import 'package:velora/feature/customer/layouts/cart/model/cart_model.dart';

part 'cart_state.dart';
part 'cart_cubit.freezed.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  Future<void> addOrUpdateCart({
    required String productId,
    required String title,
    required String image,
    required String price,
    required String categoryName,
  }) async {
    emit(const CartState.initial());

    final cartBox = HiveDatabase().cartBox!;
    final items = cartBox.values.toList();
    final index = items.indexWhere((e) => e.id == productId);

    if (index >= 0) {
      final current = items[index];
      final updated = current.copyWith(quantity: current.quantity + 1);
      await cartBox.putAt(index, updated);
      await cartBox.deleteAt(index);
    } else {
      await cartBox.add(
        CartModel(
          categoryName: categoryName,
          id: productId,
          title: title,
          image: image,
          price: price,
          quantity: 1,
        ),
      );
    }

    emit(const CartState.changed());
  }

  Future<void> clearCart() async {
    await HiveDatabase().cartBox!.clear();
    emit(const CartState.changed());
  }

  List<CartModel> get cartList {
    return HiveDatabase().cartBox!.values.toList();
  }

  double get totalPrice {
    return cartList.fold(
        0, (sum, item) => sum + double.parse(item.price) * item.quantity);
  }

  bool isInCart(String productId) {
    return cartList.any((e) => e.id == productId);
  }
}
