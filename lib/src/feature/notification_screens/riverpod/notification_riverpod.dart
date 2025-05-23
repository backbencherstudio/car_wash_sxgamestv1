import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constant/images.dart';
import '../model/notification_model.dart';
import 'notification_state.dart';

final notificationRiverpod =
    StateNotifierProvider<NotificationRiverpod, NotificationState>(
      (ref) => NotificationRiverpod(),
    );

class NotificationRiverpod extends StateNotifier<NotificationState> {
  NotificationRiverpod() : super(NotificationState()) {
    fetchNotificationData();
  }

  final List<Map<String, dynamic>> dummyJsonNotificationData = const [
    {
      "title":
          "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-24T14:30:00Z",
    },
    {
      "title":  "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-24T09:00:00Z",
    },
    {
      "title":  "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-23T18:45:00Z",
    },
    {
      "title":  "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-23T11:15:00Z",
    },
    {
      "title":  "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-22T22:10:00Z",
    },
    {
      "title":  "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-22T07:40:00Z",
    },
    {
      "title":  "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-21T12:00:00Z",
    },
    {
      "title":  "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-21T16:50:00Z",
    },
    {
      "title":  "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-25T02:00:00Z",
    },
    {
      "title":  "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-25T10:25:00Z",
    },

    {
      "title":  "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-20T02:00:00Z",
    },
    {
      "title":  "Your order has been complete now",
      "profilePicture": AppImages.shakin,
      "dateTime": "2025-05-20T10:25:00Z",
    },
  ];

  Future<void> fetchNotificationData() async {
    /// convert json/map data to dart list
    final List<NotificationModel> notificationList =
        dummyJsonNotificationData.map((notification) {
          return NotificationModel.fromJson(notification);
          // return NotificationModel(
          //   title: notification["title"],
          //   profilePicture: notification["profilePicture"],
          //   dateTime: notification["dateTime"],
          // );
        }).toList();

    notificationList.sort((a, b) => b.dateTime.compareTo(a.dateTime));

    debugPrint("\n\Raw Notification List : $notificationList\n\n");

    List<List<NotificationModel>> convertedNotificationList =
        makeNotificationList(list: notificationList);

    debugPrint(
      "\n\nConverted Notification List : $convertedNotificationList\n\n",
    );

    state = state.copyWith(notificationList: convertedNotificationList);
  }

  /// make notification sub list by date matching
  List<List<NotificationModel>> makeNotificationList({
    required List<NotificationModel> list,
  }) {
    final List<List<NotificationModel>> mainList = [];
    List<NotificationModel> subList = [];
    debugPrint("\nNotification length : ${list.length}\n\n");
    for (int i = 0; i < list.length; i++) {
      debugPrint("\nloop number : $i");
      /// If the first item of the list then just add it to sublist
      if (i == 0) {
        subList.add(list[i]);
        debugPrint("Sublist : $subList\n");
        continue;
      }

      /// If the current index day is same with previous index day then add it to the sublist
      if (list[i].dateTime.day == list[i - 1].dateTime.day) {
        subList.add(list[i]);
        debugPrint("Sublist : $subList\n");
        continue;
      }
      /// if not same then make the sublist empty, add notification to a new empty sublist
      else if (list[i].dateTime.isBefore(list[i - 1].dateTime)) {
        mainList.add(subList);
        subList = [];
        subList.add(list[i]);
        debugPrint("Sublist : $subList\n");
        debugPrint("Main List : $mainList\n");
        continue;
      }
    }
    mainList.add(subList);

    return mainList;
  }
}
