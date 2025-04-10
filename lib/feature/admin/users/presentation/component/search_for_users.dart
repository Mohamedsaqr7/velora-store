import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velora/core/common/widgets/custom_text_field.dart';
import 'package:velora/core/style/colors/colors_dark.dart';

import '../../logic/get_users/get_users_cubit.dart';

class SearchForUsers extends StatelessWidget {
  const SearchForUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUsersCubit, GetUsersState>(builder: (context, state) {
      var cubit = context.read<GetUsersCubit>();
      return CustomTextField(
        controller: cubit.searchController,
        keyboardType: TextInputType.emailAddress,
        hintText: 'search for users',
        onChanged: (value) {
          cubit.searchForUser(value);
          return null;
        },
        suffixIcon: IconButton(
          onPressed: () {
            cubit.searchController.clear();
            cubit.getAllUsers();
          },
          icon: cubit.searchController.text.isEmpty
              ? const SizedBox.shrink()
              : Icon(
                  Icons.clear,
                  color: ColorsDark.blueLight,
                ),
        ),
      );
    });
  }
}
