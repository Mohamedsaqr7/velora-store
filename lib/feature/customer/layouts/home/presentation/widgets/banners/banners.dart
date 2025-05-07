import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/animate_do.dart';
import 'package:velora/core/constants/app_assets.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/extensions/strring_extension.dart';
import 'package:velora/core/style/theme/spacing.dart';

import '../../../../../../../core/common/widgets/custom_container_linera_customer.dart';

class BannersSliders extends StatefulWidget {
  BannersSliders({
    super.key,
  });

  @override
  State<BannersSliders> createState() => _BannersSlidersState();
}

class _BannersSlidersState extends State<BannersSliders> {
  List<String> bannersList = [
    // AppAssets.homeBgDark,

    AppAssets.banner1,
    AppAssets.banner2,
    // AppAssets.banner3,
    AppAssets.banner4,
    AppAssets.banner5,
    AppAssets.banner6,
    AppAssets.banner7
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 800,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                height: 160.h,
                reverse: true,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  activeIndex = index;
                  setState(() {});
                },
              ),
              itemCount: bannersList.length,
              itemBuilder: (context, index, realIndex) {
                return CustomContainerLinearCustomer(
                  height: 160.h,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      bannersList[index],
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bannersList.asMap().entries.map((entry) {
                return Container(
                  width: 15.w,
                  height: 4.h,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: activeIndex == entry.key
                        ? context.color.bluePinkLight
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
