import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/feature/admin/add_categories/logic/get_category/get_categories_cubit.dart';
import 'package:velora/feature/admin/add_products/logic/get_all_products/get_all_products_cubit.dart';

import '../../../../../../core/common/widgets/custom_drop_down.dart';
import '../../../logic/create_product/create_product_cubit.dart';

class CcreateProductDropDown extends StatefulWidget {
  const CcreateProductDropDown({super.key});

  @override
  State<CcreateProductDropDown> createState() => _CcreateProductDropDownState();
}

class _CcreateProductDropDownState extends State<CcreateProductDropDown> {
  String? categname;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit, GetCategoriesState>(
        builder: (context, state) {
      // var cubit = GetCategoriesCubit.get(context);
      return ExpansionTile(
        title: Text('Select a dCategory'),
        children: [
          Container(
            height: 190.h,
            child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                      height: 5.h,
                    ),
                itemCount: 8,
                itemBuilder: (context, index) => Text('sss')
                // RadioListTile(
                //     title: Text(
                //       "{cubit.data!.categories[index].name}",
                //       style: context.textStyle
                //           .copyWith(color: Colors.amber, fontSize: 18.sp),
                //     ),
                //     // value: cubit.data!.categories[index].id,
                //     // groupValue: cubit.index,
                //     // onChanged: (value) => cubit.getCities(value)
                //     ),
                ),
          ),
        ],
      );
    });
  }
}

// return state.maybeMap(success: (categ) {
//   return CustomCreateDropDown(
//     items: categ.categoriesDataList.map((e) => e.name).toList(),
//     hintText: 'Select a dCategory',
//     onChanged: (value) {
//       setState(() {
//         categname = value;
//       });
//     },
//     value: categname,
//   );
// }, orElse: () {
//   return Text('data');
// });
