import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getx_standard/app/data/local/hive/hive_adapters.dart';
import 'package:getx_standard/my_app.dart';

import 'app/data/local/my_shared_pref.dart';
import 'app/service/helper/network_connectivity.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await HiveAdapters.registerAll();
  await MySharedPref.init();

  Future.delayed(Duration.zero, () {
    NetworkConnectivity.initConnectivityListener();
  });

  runApp(const ProviderScope(child: MyApp()));

  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
}
