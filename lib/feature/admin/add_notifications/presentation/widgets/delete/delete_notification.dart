import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/feature/admin/add_notifications/data/model/add_notification_model.dart';
import 'package:velora/feature/admin/add_notifications/logic/get_nots/get_notification_cubit.dart';

class DeleteNotification extends StatefulWidget {
  DeleteNotification({required this.deleteNot, super.key});
  AddNotificationModel deleteNot;

  @override
  State<DeleteNotification> createState() => _DeleteNotificationState();
}

class _DeleteNotificationState extends State<DeleteNotification> {
  bool isLoading = false;

  Future<void> _deleteNotification() async {
    setState(() => isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));
    await widget.deleteNot.delete();

    if (mounted) {
      context.read<GetNotificationCubit>().getAllNotification();
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? SizedBox(
            height: 15.h,
            width: 15.w,
            child: SpinKitHourGlass(
              color: Colors.red,
              size: 20,
            ))
        : IconButton(
            onPressed: _deleteNotification,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          );
  }
}
