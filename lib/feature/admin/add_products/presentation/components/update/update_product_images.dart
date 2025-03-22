import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/style/theme/spacing.dart';

class UpdateProductImages extends StatelessWidget {
  const UpdateProductImages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => verticalSpace(6),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Stack(
            children: [
              Container(
                height: 90.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          "https://www.footballshirtculture.com/images/stories/real-madrid-2020-2021-third-kit/real_madrid_2020_2021_third_kit_e.jpg",
                        ))),
              ),
              Container(
                height: 90.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Center(
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
