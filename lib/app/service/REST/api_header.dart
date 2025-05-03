import '../../data/local/my_shared_pref.dart';

class Header {
  // SECURE HEADER
  static Future<Map<String, String>> getSecureHeader() async {
    String? token = await MySharedPref.getAuthToken();

    return {
      "Authorization": "Bearer $token",
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  // DEFAULT HEADER
  static Map<String, String> get defaultHeader => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

  // DEFAULT MULTIPART-HEADER
  static Map<String, String> get defaultMultipartHeader => {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
      };

  // SECURE MULTIPART HEADER
  static Future<Map<String, String>> getSecureMultipartHeader() async {
    String? token = await MySharedPref.getAuthToken();
    return {
      "Authorization": "Bearer $token",
      'Accept': 'application/json',
      'Content-Type': 'multipart/form-data',
    };
  }

  // RAPID API HEADER
  static const Map<String, String> rapidApiHeader = {
    "X-RapidAPI-Key": "05741bc39bmsh35c797d07e59651p13baa5jsn936cd89ffe07",
  };
}
