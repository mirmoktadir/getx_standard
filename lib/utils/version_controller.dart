import 'package:package_info_plus/package_info_plus.dart';

class VersionController {
  String appVersion = '';
  String buildNumber = '';
  String appName = '';
  String packageName = '';

  Future<void> getAppInfo() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      appVersion = packageInfo.version;
      buildNumber = packageInfo.buildNumber;

      print('App Name: $appName');
      print('App Version: $appVersion');
      print('Build Number: $buildNumber');
    } catch (e) {
      print('Error getting app info: $e');
    }
  }
}
