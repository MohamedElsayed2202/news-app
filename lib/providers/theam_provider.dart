import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:news_app/shared_preferences/my_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode? _themeMode = ThemeMode.system;
  bool? _isDark = MyPreferences.getMode();

  ThemeProvider() {
    _setThemeMode();
  }

  get isDark {
    if (_isDark != null) {
      return _isDark;
    } else {
      if (_themeMode == ThemeMode.system) {
        final brightness = SchedulerBinding.instance!.window.platformBrightness;
        return brightness == Brightness.dark;
      } else {
        return _themeMode == ThemeMode.dark;
      }
    }
  }

  ThemeMode? get themeMode {
    return _themeMode;
  }

  _setThemeMode() {
    toggleTheme(isDark);
  }

  void toggleTheme(bool isOn) {
    _themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    _isDark = isOn;
    MyPreferences.setMode(isOn);
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    //iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );
}
