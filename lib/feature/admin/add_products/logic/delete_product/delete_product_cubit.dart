import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_product_state.dart';
part 'delete_product_cubit.freezed.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit() : super(DeleteProductState.initial());

  
}
