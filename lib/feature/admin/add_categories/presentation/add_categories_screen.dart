import 'package:flutter/material.dart';
import 'package:velora/core/context/context_extension.dart';

import '../../../../core/common/widgets/admin_app_bar.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
          isMain: true,
          title: 'Categories',
          backgroundColor: context.color.mainColor!.withOpacity(1)),
      body: Center(
        child: Text(
          'Categories Screen',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
