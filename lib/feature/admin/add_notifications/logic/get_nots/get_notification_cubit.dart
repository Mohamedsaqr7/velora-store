import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:velora/core/services/hive/hive_database.dart';

import '../../data/model/add_notification_model.dart';

part 'get_notification_state.dart';
part 'get_notification_cubit.freezed.dart';

class GetNotificationCubit extends Cubit<GetNotificationState> {
  GetNotificationCubit() : super(GetNotificationState.loading());
  Future<void> getAllNotification() async {
    try {
      emit(const GetNotificationState.loading());
      // Simulate a network call
      // Example data
      final notificationList = HiveDatabase().notificationBox!.values.toList();
      if (notificationList.isEmpty) {
        emit(const GetNotificationState.empty());
      } else {
        if (!isClosed)
          emit(GetNotificationState.success(
              notificationList: notificationList.reversed.toList()));
      }
    } catch (e) {
      if (!isClosed) emit(GetNotificationState.error(error: e.toString()));
    }
  }
  
}
