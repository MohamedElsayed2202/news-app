
import 'package:shared_preferences/shared_preferences.dart';

class MyPreferences {
  static SharedPreferences? _preferences;
  static const _keyDarkMode = 'DarkMode';
  static const _keyLocale = 'Locale';
  static const _keySeen = 'Seen';
  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }
  static Future setMode(bool mode)async{
    await _preferences!.setBool(_keyDarkMode, mode);
  }
  static bool? getMode()=>_preferences!.getBool(_keyDarkMode);

  static Future setLocale(String langCode)async{
    await _preferences!.setString(_keyLocale, langCode);
  }
  static String? getLocale()=>_preferences!.getString(_keyLocale);

  static Future setSeen(bool seen)async{
    await _preferences!.setBool(_keySeen, seen);
  }
  static bool? getSeen()=>_preferences!.getBool(_keySeen);
}
