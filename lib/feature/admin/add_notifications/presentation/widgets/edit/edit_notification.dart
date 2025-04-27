import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/feature/admin/add_notifications/presentation/widgets/edit/edit_notification_B_S.dart';
import 'package:velora/feature/admin/add_notifications/data/model/add_notification_model.dart';

import '../../../../../../core/common/bottom_sheet/custom_bottom_sheet.dart';
import '../../../logic/get_nots/get_notification_cubit.dart';

class EditNotification extends StatelessWidget {
  EditNotification({required this.addNotificationModel, super.key});
  AddNotificationModel addNotificationModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        CustomBottomSheet.showModalBottomSheetContainer(
          context: context,
          widget: EditNotificationBottomSheet(
            editNotificationModel: addNotificationModel,
          ),
          whenComplete: () =>
              context.read<GetNotificationCubit>()..getAllNotification(),
        );
      },
      icon: Icon(
        Icons.edit,
        color: Colors.yellow,
      ),
    );
  }
}
