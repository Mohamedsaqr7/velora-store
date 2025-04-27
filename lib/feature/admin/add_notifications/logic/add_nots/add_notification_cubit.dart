import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/core/services/hive/hive_database.dart';
import 'package:velora/feature/admin/add_notifications/data/model/add_notification_model.dart';

part 'add_notification_state.dart';
part 'add_notification_cubit.freezed.dart';

class AddNotificationCubit extends Cubit<AddNotificationState> {
  AddNotificationCubit() : super(AddNotificationState.initial());
  static AddNotificationCubit get(context) =>
      BlocProvider.of<AddNotificationCubit>(context);

  final formkey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController productIDController = TextEditingController();

  Future<void> createNotification() async {
    emit(const AddNotificationState.loading());
    try {
      final box = HiveDatabase().notificationBox;
      if (box == null) {
        throw Exception(
            "notificationBox is null. Did you forget to call setup()?");
      }
      // Simulate a network call or any other asynchronous operation
      await box.add(
        AddNotificationModel(
          title: titleController.text.trim(),
          body: bodyController.text.trim(),
          productID: int.parse(productIDController.text.trim()),
          createdAt: DateTime.now(),
        ),
      );
      print(HiveDatabase().notificationBox?.values.toList());

      // Emit success state
      emit(AddNotificationState.success());
    } catch (e) {
      // Emit error state
      emit(AddNotificationState.error(error: e.toString()));
    }
  }
}
