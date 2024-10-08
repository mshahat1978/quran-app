import 'package:flutter/material.dart';
import 'package:islamic_app/core/color_manager.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorManger.goldColor,
      elevation: 30,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(size: 40),
      unselectedIconTheme: IconThemeData(size: 30),
    ),
    dividerColor: ColorManger.goldColor,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 23,
        color: Color(0xff242424),
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Color(0xff242424),
      ),
    ),
  );
}
