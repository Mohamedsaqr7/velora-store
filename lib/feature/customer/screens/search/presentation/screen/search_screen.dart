import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/feature/customer/screens/product_details/presentation/widgets/customer_app_bar.dart';
import 'package:velora/feature/customer/screens/search/presentation/components/search_body.dart';

import '../../logic/search_cubit.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Search'),
        body: SearchBody(),
      ),
    );
  }
}
