import 'package:flutter/material.dart';
import 'package:velora/core/utils/app_assets.dart';

class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.noNetwork), fit: BoxFit.fill,),
        ),
      ),
    );
  }
}
