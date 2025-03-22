import 'package:flutter/material.dart';
import 'package:velora/core/context/context_extension.dart';

import '../../../../core/common/widgets/admin_app_bar.dart';
import 'components/add_product_body.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminAppBar(
          isMain: true,
          title: 'Products',
          backgroundColor: context.color.mainColor!.withOpacity(1)),
      body: AddProductBody()
    );
  }
}
