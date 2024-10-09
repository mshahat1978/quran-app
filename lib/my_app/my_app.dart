import 'package:flutter/material.dart';
import 'package:islamic_app/config/theme/my_theme.dart';
import 'package:islamic_app/core/routes_manager.dart';
import 'package:islamic_app/presentation/screens/home/home_screen.dart';
import 'package:islamic_app/presentation/screens/home/tabs/hadeth_tab/hadeth_details.dart';
import 'package:islamic_app/presentation/screens/home/tabs/quran_tab/quran_details_screen.dart';
import 'package:islamic_app/presentation/screens/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      routes: {
        RouteManager.homeRoute: (context) => HomeScreen(),
        RouteManager.splashRoute: (context) => const SplashScreen(),
        RouteManager.quranDetailsRoute: (context) => QuranDetailsScreen(),
        RouteManager.hadethDetailsRoute: (context) => HadethDetailsScreen(),
      },
      initialRoute: RouteManager.homeRoute,
    );
  }
}
