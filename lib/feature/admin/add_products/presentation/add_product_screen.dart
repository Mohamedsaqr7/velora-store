import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/di/dependency_injection.dart';

import '../../../../core/common/widgets/admin_app_bar.dart';
import '../logic/get_all_products/get_all_products_cubit.dart';
import 'widgets/add_product_body.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetAllProductsCubit>()..getAllProducts(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: Scaffold(
          appBar: AdminAppBar(
              isMain: true,
              title: 'Products',
              backgroundColor: context.color.mainColor!.withOpacity(1)),
          body: AddProductBody()),
    );
  }
}
