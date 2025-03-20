import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/app/upload_image/cubit/upload_cubit.dart';
import 'package:velora/core/common/widgets/custom_container_linear_admin.dart';
import 'package:velora/core/common/widgets/custom_linear_button.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/add_categories/logic/update_category/update_category_cubit.dart';
import 'package:velora/feature/admin/add_categories/presentation/component/delete/delete_category.dart';

import '../../../../../core/common/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../core/common/widgets/text_app.dart';
import '../../../../../core/style/fonts/font_weight.dart';
import 'update/update_category_bottom_sheet.dart';

class AddCategoryItem extends StatelessWidget {
  const AddCategoryItem(
      {super.key,
      required this.name,
      required this.image,
      required this.categoryId});

  final String name;
  final String image;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return CustomContainerLinearAdmin(
      height: 130.h,
      width: double.infinity.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                TextApp(
                  text: name,
                  theme: context.textStyle.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.bold,
                    fontFamily: FontFamily.geLocalozedFontFamily(),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: DeleteCategoryWidget(
                          categoryId: categoryId,
                        )),
                    verticalSpace(20),
                    IconButton(
                      onPressed: () {
                        uploadcategory(context);
                      },
                      icon: Icon(
                        Icons.edit,
                        size: 25.sp,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
            Flexible(
              child: CachedNetworkImage(
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 25.sp,
                  color: Colors.red,
                ),
                fit: BoxFit.contain,
                imageUrl: image,
                width: 90.w,
                height: 120.h,
              ),
            )
          ],
        ),
      ),
    );
  }

  uploadcategory(BuildContext context) {
    CustomBottomSheet.showModalBottomSheetContainer(
      context: context,
      widget: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<UpdateCategoryCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<UploadImageCubit>(),
          ),
        ],
        child: UpdateCategoryBottomSheet(
          imageUrl: image,
          categoryId: categoryId,
          ctageoryName: name,
        ),
      ),
      // whenComplete: () {
      //   context.read<UpdateCategoryCubit>()..updateCategory;
      // },
    );
  }
}
