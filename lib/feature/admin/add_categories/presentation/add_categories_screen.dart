import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/context/context_extension.dart';

import '../../../../core/common/widgets/admin_app_bar.dart';
import 'component/create/add_category_body.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AdminAppBar(
            isMain: true,
            title: 'Categories',
            backgroundColor: context.color.mainColor!.withOpacity(1)),
        body: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
          child: AddCategoriesBody(),
        ));
  }
}
