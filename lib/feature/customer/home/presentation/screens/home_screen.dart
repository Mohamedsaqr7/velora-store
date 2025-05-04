import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/feature/customer/home/logic/categories/fetch_categories_cubit.dart';
import 'package:velora/feature/customer/home/logic/products/fetch_products_cubit.dart';

import '../components/home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollUp() {
    scrollController.animateTo(
      2,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOutQuart,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<FetchCategoriesCubit>()..getCategories(),
        ),
        BlocProvider(
          create: (context) => getIt<FetchProductsCubit>()..getAllProducts(),
        ),
      ],
      child: Stack(
        children: [
          HomeBody(
            scrollController: scrollController,
          ),
          CustomFadeInLeft(
            duration: 200,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: FloatingActionButton(
                  onPressed: scrollUp,
                  backgroundColor: context.color.bluePinkLight,
                  child: const Icon(
                    Icons.arrow_upward,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
