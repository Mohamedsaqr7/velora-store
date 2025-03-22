import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/custom_drop_down.dart';
import 'package:velora/core/context/context_extension.dart';
import 'package:velora/core/style/fonts/font_weight.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/add_products/presentation/components/update/update_product_images.dart';

import '../../../../../../core/common/widgets/custom_button.dart';
import '../../../../../../core/common/widgets/custom_text_field.dart';
import '../../../../../../core/common/widgets/text_app.dart';
import '../../../../../../core/style/fonts/font_family.dart';

class UpdateProductBottomSheet extends StatefulWidget {
  const UpdateProductBottomSheet({super.key});

  @override
  State<UpdateProductBottomSheet> createState() =>
      _UpdateProductBottomSheetState();
}

class _UpdateProductBottomSheetState extends State<UpdateProductBottomSheet> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? categname;

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(
      height: 600.h,
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: TextApp(
                  text: 'Update Product',
                  theme: context.textStyle.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeightHelper.bold,
                    fontFamily: FontFamily.geLocalozedFontFamily(),
                  ),
                ),
              ),
              verticalSpace(20),
              TextApp(
                text: 'Update a photos',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                ),
              ),
              UpdateProductImages(),
              TextApp(
                text: 'Title',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                ),
              ),
              verticalSpace(15), // Title
              CustomTextField(
                controller: _titleController,
                keyboardType: TextInputType.emailAddress,
                hintText: 'Title',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Please Selected Your Product Title';
                  }
                  return null;
                },
              ),
              verticalSpace(15.h),
              TextApp(
                text: 'Price',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                ),
              ),
              verticalSpace(15), // Price
              CustomTextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                hintText: 'Price',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Selected Your Product Price';
                  }
                  return null;
                },
              ),
              verticalSpace(15),
              TextApp(
                text: 'Description',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                ),
              ),
              verticalSpace(15), //Description
              CustomTextField(
                controller: _descriptionController,
                maxLines: 4,
                keyboardType: TextInputType.multiline,
                hintText: 'Description',
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 2) {
                    return 'Please Selected Your Product description';
                  }
                  return null;
                },
              ),
              verticalSpace(15),
              TextApp(
                text: 'Category',
                theme: context.textStyle.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeightHelper.medium,
                  fontFamily: FontFamily.geLocalozedFontFamily(),
                ),
              ),
              verticalSpace(15),
              CustomCreateDropDown(
                  items: [],
                  hintText: 'real madrid',
                  onChanged: (value) {
                    setState(() {
                      categname = value;
                    });
                  },
                  value: categname),
              verticalSpace(15),
              CustomButton(
                onPressed: () {
                  // _validUpdateProduct(context);
                },
                backgroundColor: Colors.white,
                lastRadius: 20,
                threeRadius: 20,
                textColor: context.color.bluePinkDark,
                text: 'Update Product',
                width: MediaQuery.of(context).size.width,
                height: 50.h,
              ),
              verticalSpace(15),
            ],
          ),
        ),
      ),
    );
  }
}
