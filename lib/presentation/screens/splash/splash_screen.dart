import "package:flutter/material.dart";
import "package:islamic_app/core/assets_manager.dart";
import "package:islamic_app/core/routes_manager.dart";
import "package:islamic_app/providers/theme_provider.dart";
import "package:provider/provider.dart";

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);

    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
      },
    ); // non blocking
    return Container(
      child: Image.asset(
        themeProvider.isLightTheme()
            ? AssetsManager.lightSplashScreen
            : AssetsManager.splashDarkBG,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
