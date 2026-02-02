import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local/my_shared_pref.dart';
import '../../config/translations/localization_service.dart';

/// Current app locale.
final localeProvider = StateProvider<Locale>((ref) {
  return MySharedPref.getCurrentLocal();
});

/// Updates app locale and persists to shared preferences.
Future<void> updateLocale(WidgetRef ref, String languageCode) async {
  if (!LocalizationService.isLanguageSupported(languageCode)) return;
  MySharedPref.setCurrentLanguage(languageCode);
  ref.read(localeProvider.notifier).state =
      LocalizationService.supportedLanguages[languageCode]!;
}
