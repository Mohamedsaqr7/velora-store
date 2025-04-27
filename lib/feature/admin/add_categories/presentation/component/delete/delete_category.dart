import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/core/extensions/context_extension.dart';
import 'package:velora/feature/admin/add_categories/logic/delete_category/delete_category_cubit.dart';

class DeleteCategoryWidget extends StatelessWidget {
  const DeleteCategoryWidget({
    super.key,
    required this.categoryId,
  });

  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteCategoryCubit, DeleteCategoryState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: (id) {
            if (id == categoryId) {
              return SizedBox(
                  height: 15.h,
                  width: 15.w,
                  child: SpinKitHourGlass(
                    color: Colors.white,
                    size: 20,
                  ));
            } else {
              return const Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              );
            }
          },
          orElse: () {
            return InkWell(
              onTap: () {
                context.read<DeleteCategoryCubit>()
                  ..deleteCategory(categoryId: categoryId);
              },
              child: Icon(
                Icons.delete,
                color: Colors.red,
                size: 25,
              ),
            );
          },
        );
      },
    );
  }
}
