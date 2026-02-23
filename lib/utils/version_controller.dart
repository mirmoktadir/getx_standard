import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

class VersionController extends GetxController {
  final RxString appVersion = ''.obs;
  final RxString buildNumber = ''.obs;
  final RxString appName = ''.obs;
  final RxString packageName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getAppInfo();
  }

  Future<void> getAppInfo() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      appName.value = packageInfo.appName;
      packageName.value = packageInfo.packageName;
      appVersion.value = packageInfo.version;
      buildNumber.value = packageInfo.buildNumber;

      // Print the version
      Logger().i('App Name: ${appName.value}');
      Logger().i('App Version: ${appVersion.value}');
      Logger().i('Build Number: ${buildNumber.value}');
    } catch (e) {
      Logger().e('Error getting app info: $e');
    }
  }
}
