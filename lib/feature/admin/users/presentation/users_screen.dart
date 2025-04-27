import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/feature/admin/users/logic/get_users/get_users_cubit.dart';

import '../../../../core/common/widgets/admin_app_bar.dart';
import '../logic/delete_user/delete_user_cubit.dart';
import 'users_body.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<GetUsersCubit>()..getAllUsers()),
        BlocProvider(
            create: (context) => getIt<DeleteUserCubit>()),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: Scaffold(
        appBar: AdminAppBar(
            isMain: true,
            title: 'Users',
            backgroundColor: context.color.mainColor!.withOpacity(1)),
        body: UsersBody(),
      ),
    );
  }
}
