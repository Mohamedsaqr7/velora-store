import 'package:flutter/material.dart';
import 'package:velora/feature/customer/favourite/presentation/component/favourite_body.dart';
import 'package:velora/feature/customer/main/presentation/components/main_screen_appbar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MainScreenAppBar(),
      body: FavouriteBody(),
    );
  }
}
