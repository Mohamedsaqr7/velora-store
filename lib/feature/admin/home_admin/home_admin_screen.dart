import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:velora/core/common/widgets/admin_app_bar.dart';
import 'package:velora/core/common/widgets/admin_drawer_list.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/feature/admin/dashboard/presentation/dashboard.dart';
import 'package:velora/feature/admin/users/presentation/users_screen.dart';

class HomeAdminScreen extends StatefulWidget {
  const HomeAdminScreen({super.key});

  @override
  State<HomeAdminScreen> createState() => _HomeAdminScreenState();
}

class _HomeAdminScreenState extends State<HomeAdminScreen> {
  Widget page = const Dashboard();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: Builder(
        builder: (context) {
          return MenuAdminScreen(
            onPageChanged: (element) {
              setState(() {
                page = element;
              });
              ZoomDrawer.of(context)!.close();
            },
          );
        },
      ),
      mainScreen: page,
      borderRadius: 24.0.r,
      showShadow: true,
      androidCloseOnBackTap: true,
      drawerShadowsBackgroundColor: context.color.mainColor!.withOpacity(0.6),
      menuBackgroundColor: context.color.bluePinkDark!.withOpacity(0.9),
    );
  }
}

class MenuAdminScreen extends StatelessWidget {
  const MenuAdminScreen({super.key, required this.onPageChanged});
  final void Function(Widget) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.bluePinkDark,
      appBar: AdminAppBar(
          isMain: false,
          title: context.translate(LangKeys.appName),
          backgroundColor: context.color.bluePinkDark!.withOpacity(1)),
      body: Column(
        children: [
          Column(
            children: adminDrawerList(context)
                .map((element) => ListTile(
                    onTap: () {
                      onPageChanged(element.page);
                    },
                    title: element.title,
                    leading: element.icon))
                .toList(),
          ),
          Expanded(
            child: Image.asset(AppAssets.drawerImage),
          ),
        ],
      ),
    );
  }
}
