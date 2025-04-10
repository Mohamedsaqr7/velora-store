import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:velora/core/style/theme/spacing.dart';
import 'package:velora/feature/admin/users/logic/get_users/get_users_cubit.dart';
import 'package:velora/feature/admin/users/presentation/component/search_for_users.dart';
import 'package:velora/feature/admin/users/presentation/component/table_for_users.dart';

import '../../../../core/common/screens/under_build_screen.dart';

class UsersBody extends StatelessWidget {
  const UsersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          children: [
            SearchForUsers(),
            verticalSpace(20),
            Flexible(
                child: RefreshIndicator(
              onRefresh: () async {
                context.read<GetUsersCubit>()..getAllUsers();
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BlocBuilder<GetUsersCubit, GetUsersState>(
                      builder: (context, state) {
                        return state.maybeWhen(
                          orElse: () {
                            return Text('data');
                          },
                          loading: () {
                            return Padding(
                              padding: EdgeInsets.only(top: 150.0.h),
                              child: Center(
                                // heightFactor: 200,
                                child: SpinKitFadingGrid(
                                  color: Colors.white,
                                  size: 80.sp,
                                ),
                              ),
                            );
                          },search: (searchUserList) {
                            return TableForUsers(userList: searchUserList);
                          },
                          succese: (userList) {
                            return TableForUsers(userList: userList);
                          },empty: PageUnderBuildScreen.new
                          );
                      },
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: verticalSpace(20),
                  ),
                ],
              ),
            ))
          ],
        ));
  }
}
