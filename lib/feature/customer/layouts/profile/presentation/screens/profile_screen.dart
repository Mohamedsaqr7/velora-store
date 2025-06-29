import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/feature/customer/layouts/profile/logic/user_profile_cubit.dart';
import 'package:velora/feature/customer/layouts/profile/presentation/components/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserProfileCubit>()..getUserInfo(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ProfileBody(),
      ),
    );
  }
}
