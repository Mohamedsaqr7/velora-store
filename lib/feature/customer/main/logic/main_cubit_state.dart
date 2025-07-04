part of 'main_cubit_cubit.dart';

@freezed
class MainCubitState with _$MainCubitState {
  const factory MainCubitState.initial() = _Initial;
  const factory MainCubitState.selectedIconState({required NavBarEnum navBarEnum}) = _SelectedIconState;
}
