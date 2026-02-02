import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local/my_shared_pref.dart';

/// Provides whether the current theme is light.
final themeIsLightProvider = StateProvider<bool>((ref) {
  return MySharedPref.getThemeIsLight();
});

/// Toggles theme and persists to shared preferences.
void toggleTheme(WidgetRef ref) {
  final isLight = ref.read(themeIsLightProvider);
  MySharedPref.setThemeIsLight(!isLight);
  ref.read(themeIsLightProvider.notifier).state = !isLight;
}
