import 'dart:async';
import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../components/global-widgets/my_snackbar.dart';

class NetworkConnectivity {
  static StreamController<bool> connectivityController =
      StreamController<bool>.broadcast();

  static bool _isListenerInitialized = false;
  static int connectionChangeCount = 0;
  static bool _wasConnected = false;

  /// Set from app (e.g. MyApp) to refresh data when connection is restored.
  static VoidCallback? onReconnect;

  static Future<bool> isNetworkAvailable() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    bool isConnected = (connectivityResult.first != ConnectivityResult.none);

    connectivityController.add(isConnected);

    return isConnected;
  }

  static void initConnectivityListener() {
    if (!_isListenerInitialized) {
      _isListenerInitialized = true;
      Connectivity().onConnectivityChanged.listen((
        List<ConnectivityResult> result,
      ) {
        bool isConnected =
            result.isNotEmpty && (result.first != ConnectivityResult.none);
        connectivityController.add(isConnected);

        if (_wasConnected && !isConnected) {
          connectionChangeCount++;
          if (connectionChangeCount > 1) {
            _runDisconnectedOperations();
          }
        } else if (!_wasConnected && isConnected) {
          connectionChangeCount++;
          if (connectionChangeCount > 1) {
            _runConnectedOperations();
          }
        }
        _wasConnected = isConnected;
      });
    }
  }

  static void _runConnectedOperations() async {
    onReconnect?.call();
    await Future.delayed(const Duration(seconds: 2));
    MySnackBar.showSnackBar(
      title: "Connection restored!",
      message: 'Data loaded from network',
    );
  }

  static void _runDisconnectedOperations() async {
    await Future.delayed(const Duration(seconds: 2));
    MySnackBar.showErrorSnackBar(
      title: "Connection lost!",
      message: 'Data loaded from memory',
    );
  }
}
