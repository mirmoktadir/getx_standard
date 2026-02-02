import 'package:flutter/material.dart';

import '../../app/data/local/my_shared_pref.dart';
import 'ar_AR/ar_ar_translation.dart';
import 'en_US/en_us_translation.dart';

class LocalizationService {
  LocalizationService._();

  static LocalizationService? _instance;

  static LocalizationService getInstance() {
    _instance ??= LocalizationService._();
    return _instance!;
  }

  static Locale defaultLanguage = supportedLanguages['en']!;

  static Map<String, Locale> supportedLanguages = {
    'en': const Locale('en', 'US'),
    'ar': const Locale('ar', 'AR'),
  };

  static Map<String, TextStyle> supportedLanguagesFontsFamilies = {
    'en': const TextStyle(fontFamily: 'Poppins'),
    'ar': const TextStyle(fontFamily: 'Cairo'),
  };

  static Map<String, Map<String, String>> get keys => {
    'en_US': enUs,
    'ar_AR': arAR,
  };

  static bool isLanguageSupported(String languageCode) =>
      supportedLanguages.keys.contains(languageCode);

  static bool isItEnglish() =>
      MySharedPref.getCurrentLocal().languageCode.toLowerCase().contains('en');

  static Locale getCurrentLocal() => MySharedPref.getCurrentLocal();
}
