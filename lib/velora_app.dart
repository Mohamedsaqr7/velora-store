import 'package:flutter/material.dart';

class VeloraStore extends StatelessWidget {
  const VeloraStore({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Velora Store',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(appBar: AppBar(title: Text("Velora Store"))));
  }
}
