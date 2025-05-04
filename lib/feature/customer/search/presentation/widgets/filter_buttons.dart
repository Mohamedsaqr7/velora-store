import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/enums/filter_button_enum.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/customer/search/logic/search_cubit.dart';
import 'package:velora/feature/customer/search/presentation/widgets/save_filter_button.dart';
import 'package:velora/feature/customer/search/presentation/widgets/search_for_data_icon.dart';
import 'package:velora/feature/customer/search/presentation/widgets/search_name_price_button.dart';

import '../../../../../core/common/widgets/animate_do.dart';
import '../../../../../core/common/widgets/custom_text_field.dart';

class FilterButtons extends StatefulWidget {
  const FilterButtons({super.key});

  @override
  State<FilterButtons> createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  FilterButtonsEnum searchEnum = FilterButtonsEnum.non;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        var cubit = context.read<SearchCubit>();
        return Form(
          key: cubit.fromKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomFadeInRight(
                    duration: 200,
                    child: SearchNamePriceButton(
                      title: 'Search Name',
                      isSelected: searchEnum == FilterButtonsEnum.name,
                      onTap: nameSearchTap,
                    ),
                  ),
                  CustomFadeInRight(
                    duration: 200,
                    child: SearchNamePriceButton(
                      title: 'Search Price',
                      isSelected: searchEnum == FilterButtonsEnum.price,
                      onTap: priceSearchTap,
                    ),
                  ),
                ],
              ),
              verticalSpace(15),
              if (searchEnum == FilterButtonsEnum.name) ...[
                CustomFadeInDown(
                  duration: 200,
                  child: CustomTextField(
                    controller: cubit.productNameController,
                    hintText: 'Search For Product Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Search Name Cant be empty';
                      }
                      return null;
                    },
                  ),
                ),
                SaveFilterButton(
                  onTap: () {
                    if (cubit.fromKey.currentState!.validate()) {
                      cubit.searchProducts();
                    }
                  },
                ),
              ] else if (searchEnum == FilterButtonsEnum.price) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFadeInDown(
                      duration: 200,
                      child: SizedBox(
                        width: 160.w,
                        child: CustomTextField(
                          controller: cubit.minPriceController,
                          keyboardType: TextInputType.number,
                          hintText: 'Price Min',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Price Min Empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    CustomFadeInDown(
                      duration: 200,
                      child: SizedBox(
                        width: 160.w,
                        child: CustomTextField(
                          controller: cubit.maxPriceController,
                          keyboardType: TextInputType.number,
                          hintText: 'Price Max',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Price Max Empty';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SaveFilterButton(
                  onTap: () {
                    if (cubit.fromKey.currentState!.validate()) {
                      cubit.searchProducts();
                    }
                  },
                ),
              ],
              if (searchEnum == FilterButtonsEnum.non) ...[
                SizedBox(height: 100.h),
                const SearchFormDataIcon(),
              ],
            ],
          ),
        );
      },
    );
  }

  void nameSearchTap() {
    if (searchEnum == FilterButtonsEnum.name) {
      setState(() {
        searchEnum = FilterButtonsEnum.non;
        //call api
      });
    } else {
      setState(() {
        searchEnum = FilterButtonsEnum.name;
      });
    }
  }

  void priceSearchTap() {
    if (searchEnum == FilterButtonsEnum.price) {
      setState(() {
        searchEnum = FilterButtonsEnum.non;
      });
    } else {
      setState(() {
        searchEnum = FilterButtonsEnum.price;
      });
    }
  }
}
