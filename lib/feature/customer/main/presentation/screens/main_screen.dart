import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:googleapis/cloudresourcemanager/v1.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/feature/customer/layouts/favourite/presentation/favourite_screen.dart';
import 'package:velora/feature/customer/layouts/profile/presentation/screens/profile_screen.dart';
import 'package:velora/feature/customer/main/logic/main_cubit_cubit.dart';
import 'package:velora/feature/customer/notifications/presentation/screen/notification_screen.dart';

import '../../../../../core/enums/nav_bar_enum.dart';
import '../../../../../core/services/push_notifications/local_notification_service.dart';
import '../../../layouts/home/presentation/screens/home_screen.dart';
import '../components/bottom_nav_bar.dart';
import '../components/main_screen_appbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainCubitCubit>(),
      child: Scaffold(
        // backgroundColor: context.theme.mainColor!.withOpacity(1),
        appBar: MainScreenAppBar(),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  context.images.homeBg!,
                ),
                fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              Expanded(child: BlocBuilder<MainCubitCubit, MainCubitState>(
                builder: (context, state) {
                  final cubit = context.read<MainCubitCubit>();
                  if (cubit.navBarEnum == NavBarEnum.notifications) {
                    return const NotificationScreen();
                  } else if (cubit.navBarEnum == NavBarEnum.favorites) {
                    return const FavouriteScreen();
                  } else if (cubit.navBarEnum == NavBarEnum.profile) {
                    return const ProfileScreen();
                  }
                  return const HomeScreen();
                },
              )),
              MainBottomNavBar()
            ],
          ),
        ),
      ),
    );
  }
}
