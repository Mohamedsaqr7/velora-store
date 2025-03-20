import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/feature/admin/add_categories/logic/delete_category/delete_category_cubit.dart';
import 'package:velora/feature/admin/add_categories/logic/get_category/get_categories_cubit.dart';

import '../../../../core/common/widgets/admin_app_bar.dart';
import 'component/create/add_category_body.dart';

class AddCategoriesScreen extends StatelessWidget {
  const AddCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetCategoriesCubit>()..getCategories(),
        ),
        BlocProvider(
          create: (context) => getIt<DeleteCategoryCubit>(),
        ),
      ],
      child: Scaffold(
          appBar: AdminAppBar(
              isMain: true,
              title: 'Categories',
              backgroundColor: context.color.mainColor!.withOpacity(1)),
          body: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
            child: AddCategoriesBody(),
          )),
    );
  }
}
