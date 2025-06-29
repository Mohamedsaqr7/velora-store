import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/logout_button.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/extensions/strring_extension.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/auth/login/data/model/user_role_response.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key, required this.userInfoData});
  final UserRoleResponse userInfoData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: CachedNetworkImage(
            height: 80.h,
            width: 80.w,
            imageUrl: userInfoData.userImage ??
                'https://tse2.mm.bing.net/th/id/OIP.rpwndMC-G-d9JZ76ndetnAHaNb?rs=1&pid=ImgDetMain',
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
              size: 70,
            ),
          ),
        ),
        verticalSpace(7),
        TextApp(
            text: userInfoData.userName!.toLowerCase().toCapitalized(),
            theme: context.textStyle.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeightHelper.bold,
                fontFamily: FontFamily.geLocalozedFontFamily())),
        verticalSpace(7),
        TextApp(
            text: userInfoData.userEmail!.toLowerCase(),
            theme: context.textStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeightHelper.medium,
                fontFamily: FontFamily.geLocalozedFontFamily())),
      ],
    );
  }
}
