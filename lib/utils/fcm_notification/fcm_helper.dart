// ignore_for_file: unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

import '../../app/data/local/my_shared_pref.dart';
import 'awesome_notifications_helper.dart';

class FcmHelper {
  // prevent making instance
  FcmHelper._();

  // FCM Messaging
  static late FirebaseMessaging messaging;

  /// this function will initialize firebase and fcm instance
  static Future<void> initFcm() async {
    try {
      // initialize fcm and firebase core
      await Firebase.initializeApp(
          // TODO: uncomment this line if you connected to firebase via cli
          //  options: DefaultFirebaseOptions.currentPlatform,
          );

      // initialize firebase
      messaging = FirebaseMessaging.instance;

      // notification settings handler
      await _setupFcmNotificationSettings();

      // generate token if it not already generated and store it on shared pref
      await _generateFcmToken();

      // background and foreground handlers
      FirebaseMessaging.onMessage.listen(fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(fcmBackgroundHandler);
    } catch (error) {
      // if you are connected to firebase and still get error
      // check the todo up in the function else ignore the error
      // or stop fcm service from main.dart class
      Logger().e(error);
    }
  }

  ///handle fcm notification settings (sound,badge..etc)
  static Future<void> _setupFcmNotificationSettings() async {
    //show notification with sound and badge
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    //NotificationSettings settings
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );
  }

  /// generate and save fcm token if its not already generated (generate only for 1 time)
  static Future<void> _generateFcmToken() async {
    try {
      var token = await messaging.getToken();
      if (token != null) {
        MySharedPref.setFcmToken(token);
        _sendFcmTokenToServer();
      } else {
        // retry generating token
        await Future.delayed(const Duration(seconds: 5));
        _generateFcmToken();
      }
    } catch (error) {
      Logger().e(error);
    }
  }

  static _sendFcmTokenToServer() {
    var token = MySharedPref.getFcmToken();
    // TODO SEND FCM TOKEN TO SERVER
  }

  @pragma('vm:entry-point')
  static Future<void> fcmBackgroundHandler(RemoteMessage message) async {
    AwesomeNotificationsHelper.showNotification(
      id: 1,
      title: message.notification?.title ?? 'Tittle',
      body: message.notification?.body ?? 'Body',
      payload: message.data
          .cast(), // pass payload to the notification card so you can use it (when user click on notification)
    );
  }

  //handle fcm notification when app is open
  static Future<void> fcmForegroundHandler(RemoteMessage message) async {
    // Show the Awesome Notification
    AwesomeNotificationsHelper.showNotification(
      title: message.notification?.title ?? 'Title',
      body: message.notification?.body ?? 'Body',
      id: 1, // Provide a unique ID for each notification
      // Add other parameters for customization if needed
    );
  }
}
