import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/common/widgets/text_app.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/core/style/colors/colors_dark.dart';
import 'package:velora/feature/admin/users/data/models/get_all_users_response.dart';
import 'package:velora/feature/admin/users/presentation/component/delete_user.dart';
import 'package:velora/feature/admin/users/presentation/component/table_cell_title.dart';

class TableForUsers extends StatelessWidget {
  const TableForUsers({super.key, required this.userList});
  final List<UsersModel> userList;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: ColorsDark.blueLight),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FixedColumnWidth(100.w),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(110.w),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: ColorsDark.blueDark),
          children: [
            TableCell(
              child: TableCellTitleWidget(
                icon: Icons.person,
                title: 'Name',
              ),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            TableCell(
              child: TableCellTitleWidget(
                icon: Icons.email_rounded,
                title: 'Email',
              ),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            TableCell(
              child: TableCellTitleWidget(
                icon: Icons.delete,
                title: 'Delete',
              ),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
          ],
        ),
        ...List.generate(
          userList.length,
          (index) => TableRow(children: [
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(10.0.w),
                child: TextApp(
                  text: userList[index].name ?? 'dasdsa',
                  theme: context.textStyle.copyWith(),
                ),
              ),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(10.0.w),
                child: TextApp(
                  text: userList[index].email ?? 'dasdsa',
                  theme: context.textStyle.copyWith(),
                ),
              ),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
            TableCell(
              child: DeleteUserButton(
                userId: userList[index].id,
              ),
              verticalAlignment: TableCellVerticalAlignment.middle,
            ),
          ]),
        )
      ],
    );
  }
}
