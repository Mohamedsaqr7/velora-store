import 'package:flutter/material.dart';
import 'package:velora/core/common/widgets/custom_dialogs.dart';
import 'package:velora/core/constants/secure_keys.dart';
import 'package:velora/core/constants/secure_storage.dart';
import 'package:velora/core/routes/app_routes.dart';
import 'package:velora/core/style/fonts/font_weight.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomDialog.twoButtonDialog(
          context: context,
          textBody: 'Do you want log out?',
          textButton1: 'Yes',
          textButton2: 'No',
          isLoading: false,
          onPressed: () async {
            final navigator = Navigator.of(context);
            await SharedPref().removePreference(SecureKeys.accessToken);
            await SharedPref().removePreference(SecureKeys.userId);
            await SharedPref().removePreference(SecureKeys.userRole);
            await navigator.pushNamedAndRemoveUntil(
              AppRoutes.login,
              (route) => false,
            );
          },
        );
      },child: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeightHelper.bold,
            fontSize: 17,
          ),
        ),
    );
  }
}
