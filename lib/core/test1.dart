import 'package:flutter/material.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/routes/app_routes.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dsadsa'),
      ),
      body: Column(
        children: [
          Center(
            child: TextButton(
              onPressed: () => context.pushName(AppRoutes.test2)
              //  Navigator.of(context).pushNamed(AppRoutes.test2),
              ,
              child: Text(
                'dadad',
              style: TextStyle(color: context.color.mainColor),),
            ),
          
          ),
          Image.asset(context.images.testImage??'')
        ],
      ),
    );
  }
}
