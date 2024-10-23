import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  void changeAppTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    saveTheme(newTheme);
    notifyListeners();
  }

  bool isLightTheme() {
    return currentTheme == ThemeMode.light;
  }

  void saveTheme(ThemeMode newTheme) async {
    SharedPreferences sprf = await SharedPreferences.getInstance();
    if (newTheme == ThemeMode.light) {
      sprf.setString('theme', 'light');
    } else {
      sprf.setString('theme', 'dark');
    }
  }

  void getTheme() async {
    SharedPreferences sprf = await SharedPreferences.getInstance();
    String theme = sprf.getString('theme') ?? 'light';
    if (theme == 'light') {
      currentTheme = ThemeMode.light;
    } else {
      currentTheme = ThemeMode.dark;
    }
    notifyListeners();
  }
}
