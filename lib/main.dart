import "package:flutter/material.dart";
import "package:islamic_app/my_app/my_app.dart";
import "package:islamic_app/providers/language_provider.dart";
import "package:islamic_app/providers/theme_provider.dart";
import "package:provider/provider.dart";

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
    )
  ], child: const MyApp()));
}
