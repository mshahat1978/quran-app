import "package:flutter/material.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import "package:islamic_app/config/theme/my_theme.dart";
import "package:islamic_app/core/routes_manager.dart";
import "package:islamic_app/presentation/screens/hadith_details_screen/hadith_details_screen.dart";
import "package:islamic_app/presentation/screens/home/home_screen.dart";
import "package:islamic_app/presentation/screens/quran_details_screen/quran_details_screen.dart";
import "package:islamic_app/presentation/screens/splash/splash_screen.dart";
import "package:islamic_app/providers/language_provider.dart";
import "package:islamic_app/providers/quran_details_provider.dart";
import "package:islamic_app/providers/theme_provider.dart";
import "package:provider/provider.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: themeProvider.currentTheme,
      routes: {
        RoutesManager.homeRoute: (_) => HomeScreen(),
        RoutesManager.splashRoute: (_) => const SplashScreen(),
        RoutesManager.quranDetailsRoute: (_) => ChangeNotifierProvider(
            create: (context) => QuranDetailsProvider(),
            child: QuranDetailsScreen()),
        RoutesManager.hadithDetailsRoute: (_) => const HadithDetailsScreen(),
      },
      initialRoute: RoutesManager.splashRoute,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale("ar"),
        Locale("en"),
      ],
      locale: Locale(langProvider.currentLanguage),
    );
  }
}

// 1
