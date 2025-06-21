import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import '../local_storage_services/sharedPref_service.dart';

class NotificationServices {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _localNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  //Initialize Firebase Messaging
  Future<void> initialize() async {
    //Request permissions for ios
    await _firebaseMessaging.requestPermission();

    //Get the FCM token for the device
    String? token = await _firebaseMessaging.getToken();
    debugPrint("\nFCM Token : $token\n");
    if (token != null) {
      await SharedPreferenceStorageService.saveData("fcmToken", token);
    }

    //Initialize local notifications
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings("@mipmap/launcher_icon");

    const InitializationSettings initializationSettings =
    InitializationSettings(android: androidInitializationSettings);

    await _localNotificationsPlugin.initialize(initializationSettings);

    //Handle background notifications
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    //Handle foreground notifications
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    // Handle when the app is opened from a notification (Terminated state)
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        _firebaseMessagingTerminatedHandler(message);
      }
    });
  }

  //Background message handler
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async
  {
    debugPrint('Foreground message received: ${message.data}');    // final userToken = await checkIsUserLogin();
    debugPrint('Foreground message received: ${message.notification}');    // final userToken = await checkIsUserLogin();
    // if (userToken != null) {
    // await fetchNotificationList();
      _showNotification(
        message.data['title'] ?? "New Notification",
        message.data['body'] ?? "",
      );
    // } else {
    //   debugPrint("\nUser is not loged in\n");
    //   _showNotification("New Notification", "Please log in"
    //       // "Nouvelle notification",
    //       // "Veuillez vous connecter pour voir la notification",
    //       );
    // }

    //debugPrint("\nBackground Message : ${message.notification?.title}\n");
  }

  //Background message handler
  Future<void> _firebaseMessagingTerminatedHandler(
      RemoteMessage message) async {
    //final userToken = await checkIsUserLogin();
    //  if (userToken != null) {
    // await fetchNotificationList();
    // _showNotification(
    //   message.data['title'] ?? "New Notification",
    //   message.data['body'] ?? "",
    // );
    // } else {
    //   debugPrint("\nUser is not loged in\n");
    //   _showNotification("New Notification", "Please log in"
    //       // "Nouvelle notification",
    //       // "Veuillez vous connecter pour voir la notification",
    //       );
    // }

    //debugPrint("\nBackground Message : ${message.notification?.title}\n");
  }

  static int _notificationId = 0;

  //Foreground message handler
  Future<void> _onMessageHandler(RemoteMessage message) async {
    debugPrint('Foreground message data received: ${message.data}');
    debugPrint('Foreground message notification received: ${message.notification}');
    _notificationId =
        int.parse(message.data['id'] ?? "0"); // Use ID from notification data
    debugPrint("\nID : ${_notificationId}\n");
    debugPrint("\nnotification title : ${ message.data["title"] }\nnotification body : ${ message.data["body"]}\n");
    // final userToken = await checkIsUserLogin();
    //  if (userToken != null) {
    ///await fetchNotificationList();
    _showNotification(
      message.data["title"] ?? "New Notification",
      message.data["body"] ?? "",
    );

    // } else {
    //   _showNotification("New Notification", "Please log in"
    //       // "Nouvelle notification",
    //       // "Veuillez vous connecter pour voir la notification",
    //       );
    // }
  }

  static Future<void> _showNotification(String? title, String? body) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
        'general_channel', // Channel ID
        'General Notifications', // Channel Name
        importance: Importance.high,
        priority: Priority.high,
        icon: "@mipmap/launcher_icon");

    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);

    await _localNotificationsPlugin.show(
      _notificationId,
      title,
      body,
      notificationDetails,
    );
  }

  // Function to check user login status
  // static Future<String?> checkIsUserLogin() async {
  //   try {
  //     final userData = await HiveServices.getFromHive(boxName: 'currentUser');
  //     if (userData != null) {
  //       return userData["token"];
  //     } else {
  //       return null;
  //     }
  //   } catch (error) {
  //     debugPrint(
  //         "\nError while checking is User login or not. Error : $error\n");
  //   }
  //   return null;
  // }

  // static Future<void> fetchNotificationList() async {
  //   try{
  //     BuildContext? context = navigatorKey.currentContext;
  //     if (context != null) {
  //       await Future.wait([
  //         context.read<NotificationProvider>().fetchNotification(),
  //         context.read<HomeScreenProvider>().fetchAllRegisteredBattery()
  //       ]);
  //       debugPrint("\nFetch updated data after getting a notification.\n");
  //       // await context.read<NotificationProvider>().fetchNotification();
  //       // await context.read<HomeScreenProvider>().fetchAllRegisteredBattery();
  //     } else {
  //       debugPrint(
  //           "\nContext is null while fetching notification list in notification services.\n");
  //     }
  //   }catch(error){
  //     debugPrint("\nError while fetching updated data after getting a notification : $error\n");
  //   }
  //
  // }
}