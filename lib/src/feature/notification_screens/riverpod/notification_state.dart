import '../model/notification_model.dart';

class NotificationState{
  List<List<NotificationModel>>? notificationList;
  NotificationState({this.notificationList});

  NotificationState copyWith({List<List<NotificationModel>>? notificationList}){
    return NotificationState(
      notificationList: notificationList ?? this.notificationList
    );
  }
}