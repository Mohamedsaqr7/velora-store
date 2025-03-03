import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/app/connectivity_plus.dart';
import 'package:velora/core/app/env_variables.dart';
import 'package:velora/core/common/no_network_screen.dart';

class VeloraStore extends StatelessWidget {
  const VeloraStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Velora Store',
            debugShowCheckedModeBanner: EnvVariable.instance.debugMood,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Scaffold(
              appBar: AppBar(
                title: const Text('dsadsa'),
              ),
            ),
          );
        },);
  }
}
