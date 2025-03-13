import 'package:flutter/material.dart';
import 'package:velora/core/common/widgets/admin_app_bar.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/feature/admin/home_admin/home_admin_screen.dart';

import 'presentation/component/dashboard_body.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.color.mainColor,
        appBar: AdminAppBar(
            isMain: true,
            title: 'DashBoard',
            backgroundColor: context.color.mainColor!.withOpacity(1)),
        body: DashboardBody());
  }
}
