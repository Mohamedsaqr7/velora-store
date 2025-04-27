import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/add_notifications/logic/get_nots/get_notification_cubit.dart';

import '../../../../../core/common/screens/under_build_screen.dart';
import '../../../../../core/common/widgets/loading_shimmer.dart';
import '../widgets/create/create_notification.dart';
import 'add_notification_item.dart';

class AddNotificationBody extends StatelessWidget {
  const AddNotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        children: [
          CreateNotification(),
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: verticalSpace(20),
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<GetNotificationCubit, GetNotificationState>(
                  builder: (context, state) {
                    return state.maybeWhen(orElse: () {
                      return Text('data');
                    }, loading: () {
                      return ListView.separated(
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => verticalSpace(10),
                        itemBuilder: (context, index) {
                          return LoadingShimmer(
                              height: 130.h, borderRadius: 15.r);
                        },
                      );
                    }, success: (notificationList) {
                      return ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return AddNotificationItem(index: index,
                                addNotificationModel: notificationList[index]);
                          },
                          separatorBuilder: (context, index) =>
                              verticalSpace(15),
                          itemCount: notificationList.length);
                    }, error: (error) {
                      return SliverToBoxAdapter(
                        child: Text(
                          error,
                        ),
                      );
                    });
                  },
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
