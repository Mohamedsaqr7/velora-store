import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/dashboard/presentation/component/dashboard_container.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: RefreshIndicator(
        onRefresh: () async {},
        child: ListView(
          children: [
            DashboardContainer(
              image: AppAssets.productsDrawer,
              number: "0",
              title: 'products',
              isLoading: false,
            ),
            verticalSpace(20),
            DashboardContainer(
              image: AppAssets.categoriesDrawer,
              number: "0",
              title: 'Categories',
              isLoading: false,
            ),
            verticalSpace(20),
            const DashboardContainer(
              image: AppAssets.usersDrawer,
              number: "0",
              title: 'Users',
              isLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}

/* 
// كلاس كبير 
جواه ليست اوف كلاس الاسم و الصوره والحاجات دي 
وكلاس الحاجات دي جواه كلاس الكاتيجوري
*/