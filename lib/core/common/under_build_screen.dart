import 'package:flutter/material.dart';
import 'package:velora/core/utils/app_assets.dart';

class PageUnderBuildScreen extends StatelessWidget {
  const PageUnderBuildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.pageunder),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
} 