import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/extensions/strring_extension.dart';

import '../../../../../core/common/widgets/animate_do.dart';
import '../../../../../core/common/widgets/custom_container_linera_customer.dart';

class ProductDetailsImageSlider extends StatefulWidget {
  const ProductDetailsImageSlider({super.key, required this.imageList});
  final List<String> imageList;

  @override
  State<ProductDetailsImageSlider> createState() =>
      _ProductDetailsImageSliderState();
}

class _ProductDetailsImageSliderState extends State<ProductDetailsImageSlider> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomFadeInRight(
      duration: 500,
      child: Column(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 250.h,
              reverse: true,
              viewportFraction: 0.8,
              autoPlay: true,
              autoPlayCurve: Curves.decelerate,
              onPageChanged: (index, reason) {
                activeIndex = index;
                setState(() {});
              },
            ),
            itemCount: widget.imageList.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                width: 400,
                margin: const EdgeInsets.symmetric(
                    horizontal: 5), // مسافة بين الصور
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: widget.imageList[index].imageProductFormate() ??
                        "https://tse1.mm.bing.net/th/id/OIP.rWXOMlCT6V8449VVCuT41gHaFj?rs=1&pid=ImgDetMain",
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const SizedBox.shrink(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imageList.asMap().entries.map((entry) {
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
    );
  }
}
