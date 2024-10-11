import 'package:flutter/material.dart';
import 'package:myapp/themes/dark_mode.dart';
import 'package:myapp/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  
  // Getter to expose the current theme
  ThemeData get themeData => _themeData;
  
  // Getter to check if dark mode is active
  bool get isDarkMode => _themeData == darkMode;

  // Toggle theme between light and dark mode
  void toggleTheme(bool isDark) {
    _themeData = isDark ? darkMode : lightMode;
    notifyListeners();  // Notify listeners of the change
  }
}
