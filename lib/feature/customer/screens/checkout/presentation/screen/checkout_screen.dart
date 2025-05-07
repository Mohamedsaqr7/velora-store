import 'package:flutter/material.dart';

import '../../../product_details/presentation/widgets/customer_app_bar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.totalPrice});
  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'checkout'),
      body: Center(child: Text('${totalPrice}')),
    );
  }
}
