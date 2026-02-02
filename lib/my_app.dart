import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/core/app_router.dart';
import 'app/core/navigator_key.dart';
import 'app/providers/home_provider.dart';
import 'app/providers/locale_provider.dart';
import 'app/providers/theme_provider.dart';
import 'app/service/helper/network_connectivity.dart';
import 'config/theme/my_theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeIsLight = ref.watch(themeIsLightProvider);
    final locale = ref.watch(localeProvider);

    // Set connectivity reconnect callback so we can refresh home when back online
    NetworkConnectivity.onReconnect ??= () =>
        ref.read(homeProvider.notifier).getRecipes();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return MaterialApp.router(
          title: "GetXStandard",
          debugShowCheckedModeBanner: false,
          theme: MyTheme.getThemeData(isLight: themeIsLight),
          locale: locale,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: child!,
            );
          },
          routerConfig: appRouter,
        );
      },
    );
  }
}
