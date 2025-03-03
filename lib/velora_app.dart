import 'package:flutter/material.dart';
import 'package:velora/core/app/connectivity_plus.dart';
import 'package:velora/core/app/env_variables.dart';
import 'package:velora/core/common/no_network_screen.dart';
import 'package:velora/core/routes/app_routes.dart';

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
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialRoute: AppRoutes.test1, 
    );
  }
}
