import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/extensions/strring_extension.dart';
import 'package:velora/feature/customer/categories/logic/get_all_category_cubit.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../product_details/presentation/widgets/customer_app_bar.dart';
import '../components/customer_category_body.dart';

class ShowCategoriesScreen extends StatelessWidget {
  const ShowCategoriesScreen({super.key, required this.categoryInfo});
  final ({String categoryName, int categoryId}) categoryInfo; //ااسمه record
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>getIt<GetAllCategoryCubit>()..productDetails(specCategoryId: categoryInfo.categoryId),
      child: Scaffold(
          appBar: CustomAppBar(title: categoryInfo.categoryName),
          body: CustomerCategoryBody()),
    );
  }
}
