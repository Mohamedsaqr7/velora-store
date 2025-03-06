import 'package:flutter/material.dart';
import 'package:velora/core/common/widgets/auth_custom_painter.dart';
import 'package:velora/core/context/context_extension.dart';

import '../component/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomPaint(
        size: Size(double.infinity, 150),
        painter: AuthCustomPainter(
          gradient: LinearGradient(
            colors: [
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkLight!,
              context.color.bluePinkDark!,
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: LoginScreenBody()),
    );
  }
}
