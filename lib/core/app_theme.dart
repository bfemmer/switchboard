import 'package:flutter/material.dart';

import 'config/app_theme_preferences.dart';

class AppTheme extends ChangeNotifier {
  late bool _isDark;
  late AppThemePreferences _preferences;
  bool get isDark => _isDark;

  AppTheme() {
    _isDark = false;
    _preferences = AppThemePreferences();
    getPreferences();
  }

  set isDark(bool value) {
    _isDark = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _isDark = await _preferences.getTheme();
    notifyListeners();
  }
}
