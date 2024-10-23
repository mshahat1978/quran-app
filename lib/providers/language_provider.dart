import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = 'en';

  void changeAppLang(String newLang) {
    if (currentLanguage == newLang) return;
    currentLanguage = newLang;
    saveLang(newLang);
    notifyListeners();
  }

  void saveLang(String newLang) async {
    SharedPreferences sprf = await SharedPreferences.getInstance();
    if (newLang == 'en') {
      sprf.setString('lang', 'en');
    } else {
      sprf.setString('lang', 'ar');
    }
  }

  void getLang() async {
    SharedPreferences sprf = await SharedPreferences.getInstance();
    String lang = sprf.getString('lang') ?? 'en';
    if (lang == 'en') {
      currentLanguage = 'en';
    } else {
      currentLanguage = 'ar';
    }
    notifyListeners();
  }
}
