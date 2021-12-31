
import 'package:flutter/material.dart';
import 'package:news_app/l10n/l10n.dart';
import 'package:news_app/shared_preferences/my_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale? _chosedLocale;
  Locale? locale;
  LocaleProvider({this.locale}){
    _getLocale();
}

  _getLocale() {
    if (MyPreferences.getLocale() != null) {
      _chosedLocale = Locale(MyPreferences.getLocale()!);
    } else {
      if (L10n.all.contains(locale)) {
        _chosedLocale = locale;
      } else {
        _chosedLocale = const Locale('en');
      }
    }
  }

  get chosedLocale => _chosedLocale;

  setLocale(Locale locale) {
    _chosedLocale = locale;
    MyPreferences.setLocale(locale.languageCode);
    notifyListeners();
  }

  clearLocale() {
    locale = Locale as Locale;
    notifyListeners();
  }
}
