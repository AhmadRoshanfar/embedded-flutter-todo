import 'package:flutter/material.dart';

enum Modes { light, dark }

class ThemeProvider with ChangeNotifier {
  Modes _themeMode = Modes.light;

  Modes get themeMode => _themeMode;

  void toggleTheme() {
    if (_themeMode == Modes.light) {
      _themeMode = Modes.dark;
    } else if (_themeMode == Modes.dark) {
      _themeMode = Modes.light;
    }
    notifyListeners();
  }
}
