import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../app/data/local/my_shared_pref.dart';

Future<void> handleBackgroundMessage(RemoteMessage? message) async {
  if (message == null) return;
  // await 5.delay();
  //await Get.find<HomeController>().getNotifications(
  //    MySharedPref.getLangID() ?? "2"); // update notification UI
  Logger().i("New notification has arrived in background");
}

late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

class NotificationHelper {
  final _firebaseMessaging = FirebaseMessaging.instance;

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    Logger().i(message.notification?.title);
    _onNotificationTap(jsonEncode(message.toMap()));
  }

  void initLocalNotification() async {
    const InitializationSettings initializationSettings =
        InitializationSettings(
          android: AndroidInitializationSettings("@mipmap/ic_launcher"),
          iOS: DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
          ),
        );

    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
            _onNotificationTap(notificationResponse.payload);
          },
    );
  }

  static Future<void> _onNotificationTap(String? payload) async {
    if (payload != null) {
      // await Get.find<HomeController>()
      //     .getNotifications(MySharedPref.getLangID() ?? "2");

      // Get.key.currentState
      //    ?.pushNamed(Routes.NOTIFICATION_HOME, arguments: payload);
    }
  }

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'notification_channel', // Change this to a unique channel ID
      'Notification Channel', // Change this to a channel name
      description:
          'This channel is used for push notifications.', // description
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
    isFlutterLocalNotificationsInitialized = true;
  }

  void initPushNotification() {
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) async {
      if (message != null) {
        Logger().i(
          "App opened from terminated state via notification: ${message.toMap()}",
        );
        await 5.delay();
        _onNotificationTap(
          jsonEncode(message.toMap()),
        ); // Handle tap and navigation
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
  }

  Future<void> showFlutterNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      //  await 5.delay();
      //  await Get.find<HomeController>().getNotifications(
      //     MySharedPref.getLangID() ?? "2"); // update notification UI

      Logger().i("New notification has arrived in foreground");
      flutterLocalNotificationsPlugin.show(
        id: notification.hashCode,
        title: notification.title,
        body: notification.body,
        payload: jsonEncode(message.toMap()),
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: "@mipmap/ic_launcher",
          ),
          iOS: const DarwinNotificationDetails(),
        ),
      );
    }
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    MySharedPref.setFcmToken(fcmToken!);
    await setupFlutterNotifications();
    initLocalNotification();
    initPushNotification();
  }
}
