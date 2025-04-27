import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/app/upload_image/cubit/upload_cubit.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/feature/admin/add_categories/logic/get_category/get_categories_cubit.dart';
import 'package:velora/feature/admin/add_products/logic/create_product/create_product_cubit.dart';
import 'package:velora/feature/admin/add_products/logic/get_all_products/get_all_products_cubit.dart';
import 'package:velora/feature/admin/add_products/presentation/components/create/create_product_bottom_sheet.dart';

import '../../../../../../core/common/bottom_sheet/custom_bottom_sheet.dart';
import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/loading_shimmer.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/theme/spacing.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextApp(
              text: "get all Products",
              theme: context.textStyle.copyWith(
                  fontSize: 18.sp,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                  fontWeight: FontWeightHelper.regular),
            ),
            CustomButton(
              onPressed: () {
                CustomBottomSheet.showModalBottomSheetContainer(
                  context: context,
                  widget: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => getIt<CreateProductCubit>(),
                      ),
                      BlocProvider(
                        create: (context) => getIt<UploadImageCubit>(),
                      ),
                      BlocProvider(
                        create: (context) => getIt<GetCategoriesCubit>(),
                      ),
                    ],
                    child: CreateProductBottomSheet(),
                  ),
                );
              },
              text: 'add',
              width: 90.w,
              backgroundColor: context.color.bluePinkLight,
              height: 35.h,
              lastRadius: 10.r,
              threeRadius: 10.r,
            ),
            //addcategoryitem
          ],
        ),
        verticalSpace(10),
      ],
    );
  }
}
