import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _currentTheme;

  AppTheme(this._currentTheme);

  ThemeMode get currentTheme => _currentTheme;

  void changeTheme() {
    if (_currentTheme == ThemeMode.light)
      _currentTheme = ThemeMode.dark;
    else
      _currentTheme = ThemeMode.light;
    notifyListeners();
  }
}
