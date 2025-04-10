import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/core/common/widgets/show_toast.dart';
import 'package:velora/feature/admin/users/logic/delete_user/delete_user_cubit.dart';
import 'package:velora/feature/admin/users/logic/get_users/get_users_cubit.dart';

class DeleteUserButton extends StatelessWidget {
  const DeleteUserButton({
    super.key,
    this.userId,
  });
  final String? userId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteUserCubit, DeleteUserState>(
      listener: (context, state) {
        // TODO: implement listener
        state.whenOrNull(

            // failure: (message) {
            //   ShowToast.showFailureToast(fail);
            // },
            success: () {
          context.read<GetUsersCubit>().getAllUsers();
          ShowToast.showSuccessToast("User has been deleted successfully");
        });
      },
      builder: (context, state) {
        return state.maybeWhen(orElse: () {
          return InkWell(
            onTap: () {
              context.read<DeleteUserCubit>().deleteUser(userId: userId!);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        }, loading: (id) {
          if (id == userId) {
            return SizedBox(
                height: 15.h,
                width: 15.w,
                child: SpinKitHourGlass(
                  color: Colors.white,
                  size: 20,
                ));
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            );
          }
        });
      },
    );
  }
}
