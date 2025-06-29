import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/extensions/context_extension.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton(
      {required this.size,
      required this.onTap,
      super.key,
      required this.isInCart});

  final double size;
  final VoidCallback onTap;
  final bool isInCart;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      icon: Icon(
        isInCart
            ? Icons.shopping_cart_rounded
            : Icons.shopping_cart_checkout_rounded,
        color: isInCart ? context.color.bluePinkLight : context.color.textColor,
        size: size.sp,
      ),
    );
  }
}
