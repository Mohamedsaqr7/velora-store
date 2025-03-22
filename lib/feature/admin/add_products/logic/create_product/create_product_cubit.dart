import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_product_state.dart';
part 'create_product_cubit.freezed.dart';

class CreateProductCubit extends Cubit<CreateProductState> {
  CreateProductCubit() : super(CreateProductState.initial());

  
}
