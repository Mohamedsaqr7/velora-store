import 'package:flutter/material.dart';
import 'package:velora/core/context/context_extension.dart';

import '../../../../core/common/widgets/admin_app_bar.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
          isMain: true,
          title: 'Users',
          backgroundColor: context.color.mainColor!.withOpacity(1)),
      body: Center(
        child: Text(
          'Users Screen',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
