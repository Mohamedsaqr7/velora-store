import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/language/lang_keys.dart';

import '../../../product_details/presentation/widgets/customer_app_bar.dart';
import '../../logic/view_all_products_cubit.dart';
import '../component/view_all_products_body.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsViewAllCubit>()
,      child: Scaffold(
        body: ViewAllProductsBody(),
        appBar: CustomAppBar(
          title: context.translate(LangKeys.viewAll),
        ),
      ),
    );
  }
}
