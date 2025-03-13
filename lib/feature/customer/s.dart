import 'package:flutter/material.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/feature/admin/home_admin/home_admin_screen.dart';

class cust extends StatelessWidget {
  const cust({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeAdminScreen(),
                  ));
            },
            child: Text('dassssssssssssssssssx ta')),
      ),
    );
  }
}
