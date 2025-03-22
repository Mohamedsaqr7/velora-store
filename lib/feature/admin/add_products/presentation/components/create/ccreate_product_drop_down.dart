import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/custom_drop_down.dart';

class CcreateProductDropDown extends StatefulWidget {
  const CcreateProductDropDown({super.key});

  @override
  State<CcreateProductDropDown> createState() => _CcreateProductDropDownState();
}

class _CcreateProductDropDownState extends State<CcreateProductDropDown> {
  String? categname;

  @override
  Widget build(BuildContext context) {
    return CustomCreateDropDown(
        items: [],
        hintText: 'Select a Category',
        onChanged: (value) {
          setState(() {
            categname = value;
          });
        },
        value: categname);
  }
}
