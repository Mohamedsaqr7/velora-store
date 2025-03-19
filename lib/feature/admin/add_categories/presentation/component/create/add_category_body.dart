import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/app/upload_image/cubit/upload_cubit.dart';
import 'package:velora/core/common/bottom_sheet/custom_bottom_sheet.dart';
import 'package:velora/core/common/widgets/custom_button.dart';
import 'package:velora/core/common/widgets/loading_shimmer.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/di/dependency_injection.dart';
import 'package:velora/core/language/lang_keys.dart';
import 'package:velora/core/style/fonts/font_family.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/add_categories/logic/create_category/create_category_cubit.dart';
import 'package:velora/feature/admin/add_categories/logic/get_category/get_categories_cubit.dart';
import 'package:velora/feature/admin/add_categories/presentation/component/create/add_category_item.dart';
import 'package:velora/feature/admin/add_categories/presentation/component/create/create_category_bottom_sheet.dart';

class AddCategoriesBody extends StatelessWidget {
  const AddCategoriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextApp(
              text: "get all categories",
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
                          create: (context) => getIt<CreateCategoryCubit>(),
                        ),
                        BlocProvider(
                          create: (context) => getIt<UploadImageCubit>(),
                        ),
                      ],
                      child: CreateCategoryBottomSheet(),
                    ),
                    whenComplete: () {
                      context.read<GetCategoriesCubit>()..getCategories();
                    });
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
        Expanded(
          child: RefreshIndicator(
            color: context.color.bluePinkDark,
            onRefresh: () async {
              context.read<GetCategoriesCubit>()..getCategories();
            },
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: verticalSpace(20.h),
                ),
                SliverToBoxAdapter(
                  child: BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
                    builder: (context, state) {
                      var cubit = context.read<GetCategoriesCubit>();
                      return state.maybeWhen(
                        orElse: () {
                          return Text('data');
                        },
                        loading: () {
                          return ListView.separated(
                            itemCount: 4,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                verticalSpace(10),
                            itemBuilder: (context, index) {
                              return LoadingShimmer(
                                  height: 130.h, borderRadius: 15.r);
                            },
                          );
                        },
                        success: (list) {
                          return ListView.separated(
                            itemCount: list?.length ?? 2,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) =>
                                verticalSpace(10),
                            itemBuilder: (context, index) {
                              return AddCategoryItem(
                                  categoryId: list?[index]?.id ?? "4",
                                  name: list?[index]?.name ?? 'macbook',
                                  image: list?[index]?.image ?? '');
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
//
