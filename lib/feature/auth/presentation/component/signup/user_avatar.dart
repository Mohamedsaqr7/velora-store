import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/animate_do.dart';

class UserAvatarScreen extends StatelessWidget {
  const UserAvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 400,
      child: CircleAvatar(
        radius: 38.r,child: Icon(Icons.person),
      ),
    );
  }
}
