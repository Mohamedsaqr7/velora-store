import 'package:flutter/material.dart';

import '../../../../screens/product_details/presentation/widgets/customer_app_bar.dart';
import '../component/cart_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'cart'),
      body: CartBody(),
    );
  }
}
