import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/enums/nav_bar_enum.dart';

part 'main_cubit_state.dart';
part 'main_cubit_cubit.freezed.dart';

class MainCubitCubit extends Cubit<MainCubitState> {
  MainCubitCubit() : super(MainCubitState.initial());
  
  NavBarEnum navBarEnum = NavBarEnum.home;

  void selectedNavBarIcons(NavBarEnum viewEnum) {
    if (viewEnum == NavBarEnum.home) {
      navBarEnum = NavBarEnum.home;
    } else if (viewEnum == NavBarEnum.catgeories) {
      navBarEnum = NavBarEnum.catgeories;
    } else if (viewEnum == NavBarEnum.favorites) {
      navBarEnum = NavBarEnum.favorites;
    } else if (viewEnum == NavBarEnum.profile) {
      navBarEnum = NavBarEnum.profile;
    }
    emit(MainCubitState.selectedIconState(navBarEnum: navBarEnum));
  }
}
