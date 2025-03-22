import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_product_state.dart';
part 'update_product_cubit.freezed.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  UpdateProductCubit() : super(UpdateProductState.initial());

  
}
