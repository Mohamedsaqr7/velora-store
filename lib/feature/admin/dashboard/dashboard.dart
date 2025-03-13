import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/common/widgets/admin_app_bar.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/feature/admin/dashboard/data/repo/dashboard_repo.dart';
import 'package:velora/feature/admin/dashboard/presentation/logic/categories_number_cubit/categories_cubit.dart';
import 'package:velora/feature/admin/dashboard/presentation/logic/products_number_cubit/product_cubit.dart';
import 'package:velora/feature/admin/dashboard/presentation/logic/users_number_cubit/users_cubit.dart';
import 'package:velora/feature/admin/home_admin/home_admin_screen.dart';

import 'presentation/component/dashboard_body.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ProductCubit(getIt<DashboardRepo>())..fetchNumberOfProducts(),
          ),
          BlocProvider(
            create: (context) => CategoriesCubit(getIt<DashboardRepo>())
              ..fetchNumberOfCategories(),
          ),
          BlocProvider(
            create: (context) =>
                UsersCubit(getIt<DashboardRepo>())..fetchNumberOfUsers(),
          ),
        ],
        child: Scaffold(
            backgroundColor: context.color.mainColor,
            appBar: AdminAppBar(
                isMain: true,
                title: 'DashBoard',
                backgroundColor: context.color.mainColor!.withOpacity(1)),
            body: DashboardBody()));
  }
}
