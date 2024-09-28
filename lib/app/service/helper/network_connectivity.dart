import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:getx_standard/app/modules/example/home-with-restAPI/controllers/home_controller.dart';

import '../../components/global-widgets/my_snackbar.dart';

final homeController = Get.put(HomeController());

class NetworkConnectivity {
  static StreamController<bool> connectivityController =
      StreamController<bool>.broadcast();

  static bool _isListenerInitialized = false;
  static int connectionChangeCount = 0;
  static bool _wasConnected = false;

  static Future<bool> isNetworkAvailable() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    bool isConnected = (connectivityResult != ConnectivityResult.none);

    connectivityController.add(isConnected);

    return isConnected;
  }

  static void initConnectivityListener() {
    if (!_isListenerInitialized) {
      _isListenerInitialized = true;
      Connectivity()
          .onConnectivityChanged
          .listen((List<ConnectivityResult> result) {
        // Assuming only one result is relevant for you, take the first result from the list.
        bool isConnected =
            result.isNotEmpty && (result.first != ConnectivityResult.none);
        connectivityController.add(isConnected);

        if (_wasConnected && !isConnected) {
          // Disconnected after being connected
          connectionChangeCount++;
          if (connectionChangeCount > 1) {
            // First or later disconnection
            _runDisconnectedOperations();
          }
        } else if (!_wasConnected && isConnected) {
          // Connected after being disconnected
          connectionChangeCount++;
          if (connectionChangeCount > 1) {
            // First or later reconnection
            _runConnectedOperations();
          }
        }
        _wasConnected = isConnected;
      });
    }
  }

  static void _runConnectedOperations() async {
    await homeController.getRecipes();
    await 2.delay();
    MySnackBar.showSnackBar(
        title: "Connection restored!", message: 'Data loaded from network');
  }

  static void _runDisconnectedOperations() async {
    await 2.delay();
    MySnackBar.showErrorSnackBar(
        title: "Connection lost!", message: 'Data loaded from memory');
  }
}
