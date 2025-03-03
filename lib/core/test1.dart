import 'package:flutter/material.dart';
import 'package:velora/core/navigation.dart';
import 'package:velora/core/routes/app_routes.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('dsadsa'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.pushName(AppRoutes.test2)
          //  Navigator.of(context).pushNamed(AppRoutes.test2),
          ,
          child: Text('dadad'),
        ),
      ),
    );
  }
}
