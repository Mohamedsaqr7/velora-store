// List<DrawerItemModel>

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/custom_dialogs.dart';
import 'package:velora/core/common/widgets/logout_button.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/constants/secure_keys.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/feature/admin/add_notifications/presentation/add_notifications_screen.dart';
import 'package:velora/feature/admin/add_products/presentation/add_product_screen.dart';
import 'package:velora/feature/admin/dashboard/presentation/dashboard.dart';
import 'package:velora/feature/admin/users/presentation/users_screen.dart';

import '../../../feature/admin/add_categories/presentation/add_categories_screen.dart';
import '../../constants/secure_storage.dart';
import '../../routes/app_routes.dart';

List<DrawerItemModel> adminDrawerList(BuildContext context) {
  return <DrawerItemModel>[
    //DashBoard
    DrawerItemModel(
      icon: const Icon(
        Icons.dashboard,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'DashBoard',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamily.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      page: const Dashboard(),
    ),
    //Categories
    DrawerItemModel(
      icon: const Icon(Icons.category_outlined, color: Colors.white),
      title: TextApp(
        text: 'Categories',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamily.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      page: const AddCategoriesScreen(),
    ),
    //Product
    DrawerItemModel(
      icon: const Icon(
        Icons.production_quantity_limits,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'Products',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamily.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      page: const AddProductScreen(),
    ),
    //Users
    DrawerItemModel(
      icon: const Icon(
        Icons.people_alt_rounded,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'Users',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamily.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      page: const UsersScreen(),
    ),
    //Notifications
    DrawerItemModel(
      icon: const Icon(
        Icons.notifications_active,
        color: Colors.white,
      ),
      title: TextApp(
        text: 'Notifications',
        theme: context.textStyle.copyWith(
          color: Colors.white,
          fontSize: 17.sp,
          fontFamily: FontFamily.poppinsEnglish,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
      page: const AddNotifications(),
    ),
    //LogOut
    DrawerItemModel(
      icon: const Icon(
        Icons.exit_to_app,
        color: Colors.white,
      ),
      title: LogoutButton(),
      page: const UsersScreen(),
    ),
  ];
}

class DrawerItemModel {
  DrawerItemModel({
    required this.icon,
    required this.title,
    required this.page,
  });

  final Icon icon;
  final Widget title;
  final Widget page;
}
