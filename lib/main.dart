import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_standard/app/data/local/hive/hive_adapters.dart';
import 'package:getx_standard/my_app.dart';

import 'app/data/local/my_shared_pref.dart';
import 'app/service/helper/network_connectivity.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Preserve the splash screen while initializing
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  // Device orientation
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  // init hive and adapters
  await HiveAdapters.registerAll();

  // Device info
  //  DeviceInfoHelper.initializeDeviceInfo();

  // Shared pref
  await MySharedPref.init();

  // inti fcm services
  // await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );

  // initialize local notifications
  // await NotificationHelper().initNotification();

  // Connectivity
  Future.delayed(Duration.zero, () {
    NetworkConnectivity.initConnectivityListener();
  });

  ///****************************************** My App ************************************///

  runApp(
    const MyApp(),
  );

   // remove splash screen after 2 seconds
  await 2.delay();
  FlutterNativeSplash.remove();
}
