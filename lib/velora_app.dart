import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/app/connectivity_plus.dart';
import 'package:velora/core/app/env_variables.dart';
import 'package:velora/core/common/no_network_screen.dart';
import 'package:velora/core/style/font_family.dart';

import 'core/style/font_weight.dart';

class VeloraStore extends StatelessWidget {
  const VeloraStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Velora Store',
      debugShowCheckedModeBanner: EnvVariable.instance.debugMood,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'data',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: const Center(
          child: Column(
            children: [
              // Old
              Text(
                'Old Font',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'محمد صقر',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              // New

              Text(
                'Old Font',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: FontFamily.poppinsEnglish,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),

              Text(
                'محمد صقر',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: FontFamily.cairoArabic,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
