import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/style/theme/spacing.dart';

class CreateProductImages extends StatelessWidget {
  const CreateProductImages({super.key});

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
