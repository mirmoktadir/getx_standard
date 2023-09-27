class Header {
  // SECURE HEADER
  static Map<String, dynamic> secureHeader = {
    "Authorization": "Bearer 'token'",
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  // DEFAULT HEADER
  static Map<String, dynamic> defaultHeader = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };

  // DEFAULT MULTIPART-HEADER
  static Map<String, dynamic> defaultMultipartHeader = {
    'Accept': 'application/json',
    'Content-Type': 'multipart/form-data',
  };

  // SECURE MULTIPART HEADER
  static Map<String, dynamic> secureMultipartHeader = {
    "Authorization": "Bearer 'token'",
    'Accept': 'application/json',
    'Content-Type': 'multipart/form-data',
  };

  /// ***************** PERSONAL CUSTOM API HEADER ***************** ///
  // RAPID API HEADER
  static Map<String, dynamic> rapidApiHeader = {
    "X-RapidAPI-Key": "05741bc39bmsh35c797d07e59651p13baa5jsn936cd89ffe07",
  };
}
