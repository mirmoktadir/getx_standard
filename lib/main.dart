import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_standard/app/data/local/my_hive.dart';
import 'package:getx_standard/app/modules/home-with-restAPI/model/posts.dart';

import 'app/data/local/my_shared_pref.dart';
import 'app/routes/app_pages.dart';
import 'config/theme/my_theme.dart';
import 'config/translations/localization_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Device orientation
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  // init hive and adapters
  await MyHive.init(registerAdapters: (hive) {
    hive.registerAdapter(PostsAdapter());
    //myHive.registerAdapter(OtherAdapter());
  });

  // Device info
  //  DeviceInfoHelper.initializeDeviceInfo();

  // Shared pref
  await MySharedPref.init();

  // inti fcm services
  // await FcmHelper.initFcm();

  // initialize local notifications service
  // LocalNotificationHelper.initializeNotifications();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: "GetXStandard",
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            bool themeIsLight = MySharedPref.getThemeIsLight();
            return Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              ),
            );
          },

          initialRoute: AppPages.NAV,
          // first screen to show when app is running

          defaultTransition: Transition.circularReveal,

          getPages: AppPages.routes,
          // app screens
          locale: MySharedPref.getCurrentLocal(),
          // app language
          translations:
              LocalizationService(), // localization services in app (controller app language)
        );
      },
    ),
  );
}
